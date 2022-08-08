from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail, Message
from datetime import datetime
import json
import os
from werkzeug.utils import secure_filename
import math


with open('Clean Blog\config.json', 'r') as c:
    params = json.load(c)['params']

local_server = params['local_server']

app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail-user'],
    MAIL_PASSWORD=params['gmail-password']
)
mail = Mail(app)


if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_url']
db = SQLAlchemy(app)


class Contact(db.Model):

    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(20), nullable=False)
    email = db.Column(db.String(12), nullable=False)
    phone_num = db.Column(db.String(20), nullable=False)
    msg = db.Column(db.String(20), nullable=False)
    date = db.Column(db.String(11), nullable=False)


class Posts(db.Model):

    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(20), nullable=False)
    sub_heading = db.Column(db.String(20), nullable=False)
    slug = db.Column(db.String(12), nullable=False)
    content = db.Column(db.String(20), nullable=False)
    img_file = db.Column(db.String(20), nullable=False)
    date = db.Column(db.String(11), nullable=False)


@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(params['no_of_posts']):(page-1)*int(params['no_of_posts']) + int(params['no_of_posts'])]
    if page == 1:
        prev="#"
        next="/?page=" + str(page+1)
    elif page == last:
        prev="/?page=" + str(page-1)
        next="#"
    else:
        prev="/?page=" + str(page-1)
        next="/?page=" + str(page+1)

    return render_template('index.html', params = params, posts = posts, prev = prev, next = next)


@app.route("/post/<string:post_slug>/", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()

    return render_template('post.html', params=params, post=post)


@app.route('/dashboard', methods=['GET', 'POST'])
def signin():
    if ('user' in session and session['user'] == params['admin_username']):
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts=posts)
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        if (username == params['admin_username'] and password == params['admin_password']):
            session['user'] = username
            return render_template("dashboard.html", params=params)

    return render_template('signin.html', params=params)


@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    if ('user' in session and session['user'] == params['admin_username']):
        if request.method == "POST":
            box_title = request.form.get('title')
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if sno == '0':
                post = Posts(title=box_title, sub_heading=tline, slug=slug,
                             content=content, img_file=img_file, date=date)
                db.session.add(post)
                db.session.commit()

            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.sub_heading = tline
                post.slug = slug
                post.content = content
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/'+sno)
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, post=post, sno=sno)


@app.route("/delete/<string:sno>", methods=['GET', 'POST'])
def delete(sno):
    if ('user' in session and session['user'] == params['admin_username']):
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


@app.route("/uploader", methods=['GET', 'POST'])
def uploader():
    if ('user' in session and session['user'] == params['admin_username']):
        if request.method == "POST":
            f = request.files['file1']
            f.save(os.path.join(
                app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return "Uploaded Successfully"


@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route("/about")
def about():
    return render_template('about.html', params=params)


@app.route('/contact', methods=['GET', 'POST'])
def contact():

    if (request.method == 'POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone_num')
        message = request.form.get('msg')
        entry = Contact(name=name, email=email, phone_num=phone,
                        msg=message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail_msg = Message(subject=f"Mail from {name}", sender=email, recipients=[
                           params['gmail-user']], body=f"\n\nName:\t{name}\n\nEmail:\t{email}\n\nMessage:\t{message}")
        mail.send(mail_msg)
    return render_template("contact.html", params=params)


app.run(debug=True)
