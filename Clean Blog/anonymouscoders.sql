-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2022 at 02:14 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anonymouscoders`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sno`, `name`, `email`, `phone_num`, `msg`, `date`) VALUES
(1, 'Waleed hassan', 'wh236849@gmail.com', '+923436544134', 'Nothing in the first testing message', '2022-08-05 16:46:25'),
(2, 'Testing 1', 'Testing1@gmail.com', '+123468236', 'This is my first testing in the databse', '2022-08-06 09:53:36'),
(4, 'Testing 2', 'Testing2@gmail.com', '+913456777', 'Second Test for database at localhost', '2022-08-06 09:55:02'),
(5, 'Testing 3', 'Testing3@gmail.com', '+913456777', 'First email from user Testing 3', '2022-08-06 11:08:13'),
(6, 'Testing 4', 'Testing4@gmail.com', '+913456777', 'Mail testing', '2022-08-06 11:24:06'),
(7, 'Testing 4', 'Testing4@gmail.com', '+913456777', 'Mail testing', '2022-08-06 11:27:47'),
(8, 'Testing 5', 'Testing4@gmail.com', '+913456777', 'Mail testing', '2022-08-06 11:28:01'),
(9, 'Testing 6', 'Testing4@gmail.com', '+123468236', 'asfsafsafasf', '2022-08-06 11:29:19'),
(10, 'Testing 6', 'Testing4@gmail.com', '+913456777', 'Mail Sent', '2022-08-07 14:25:40'),
(11, 'Testing 6', 'Testing4@gmail.com', '+913456777', 'Mail Sent', '2022-08-07 14:29:12'),
(12, 'Testing 6', 'Testing4@gmail.com', '+913456777', 'Mail Sent', '2022-08-07 14:29:47'),
(13, 'Testing 6', 'Testing4@gmail.com', '+913456777', 'Mail Sent', '2022-08-07 14:31:24'),
(14, 'Testing 6', 'Testing4@gmail.com', '+913456777', 'Mail Sent', '2022-08-07 14:37:20'),
(15, 'Testing 6', 'qsasAS@gmaol', '+123468236', 'Final Mail Test', '2022-08-07 14:50:00'),
(16, 'Testing 6', 'qsasAS@gmaol', '+123468236', 'Final Mail Test', '2022-08-07 14:51:05'),
(17, 'Testing 5', '03474004771@fick', '+913456777', 'sdfsddfs', '2022-08-07 14:57:44'),
(18, 'Testing 5', '03474004771@fick', '+913456777', 'sdfsddfs', '2022-08-07 15:05:49'),
(19, 'Testing 5', '03474004771@fick', '+913456777', 'sdfsddfs', '2022-08-07 15:07:16'),
(20, 'Testing 5', '03474004771@fick', '+913456777', 'sdfsddfs', '2022-08-07 15:07:44'),
(21, 'Testing 5', '03474004771@fick', '+913456777', 'sdfsddfs', '2022-08-07 15:09:47'),
(22, 'Testing 5', '03474004771@fick', '+913456777', 'sdfsddfs', '2022-08-07 15:15:30'),
(23, 'Testing 5', '03474004771@fick', '+913456777', 'sdfsddfs', '2022-08-07 15:23:14'),
(24, 'Testing 5', '03474004771@fick', '+913456777', 'sdfsddfs', '2022-08-07 15:23:39'),
(25, 'Testing 5', '03474004771@fick', '+913456777', 'sdfsddfs', '2022-08-07 15:43:59'),
(26, 'Mail Testing no 2', 'wh236849@gmail.com', '+913456777', 'Mail Sent Successfully', '2022-08-07 15:46:18'),
(27, 'Mail Testing no 2', 'wh236849@gmail.com', '+913456777', 'Mail Sent Successfully', '2022-08-07 15:47:10');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `sub_heading` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `sub_heading`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'Introduction to programming', 'Best post for beginners', 'first-post', 'WHAT IS PROGRAMMING?\r\nThere are countless definitions of what computer programming is, but here is mine. “Programming is how you get computers to solve problems.” There are two key phrases here that are important: You: without the programmer (you), the computer is useless. It does what you tell it to do. Solve problems: computers are tools. They are complex tools, admittedly, but they are not mysterious or magical: they exist to make tasks easier.\r\ncoding.jpg\r\nCOMPUTER PROGRAMS MAKE COMPUTERS WORK\r\nComputer programs (or software) are what makes computers work. Without software, modern computers are just complicated machines for turning electricity into heat. It’s software on your computer that runs your operating system, browser, email, games, movie player – just about everything.\r\n\r\nPROGRAMMING IS CREATIVE\r\nProgramming is a creative task: there is no right or wrong way to solve a problem, in the same way, that there is no right or wrong way to paint a picture. There are choices to be made, and one way may seem better than another, but that doesn’t mean the other is wrong! With the right skills and experience, a programmer can craft software to solve an unlimited number of problems – from telling you when your next train will arrive at playing your favorite music. The possibilities are constrained only by your imagination. That’s why I love programming.\r\n\r\nPROGRAMMING LANGUAGES\r\nUnfortunately, computers don’t understand languages like English or Spanish, so we have to use a programming language they understand to give them instructions. There are many different programming languages, all of which have their own merits, and certain languages are better suited to particular types of tasks, but there is no one language that is the ‘best’ In this course, you will be programming using a language called Python. Python is one of a group of languages called “general-purpose programming languages”, which can be used to solve a wide variety of problems. Other popular languages in this category are C, Ruby, Java and BASIC. This is a small Python program that asks the user to enter their name and says “Hi” to them:\r\n\r\nprint(\"Hello and welcome.\")\r\n\r\nname = input(\"Whats your name?\")\r\n\r\nif name == \"Martin\":\r\n\r\nprint(\"That\'s my name too!\")\r\n\r\nprint(\"Hi \" + name)\r\n\r\nYou don’t need to be a computer programmer to be able to read this code. It contains English words and it is readable (if not perhaps understandable). Programs are often referred to as code and hence programming is also known as coding.', 'coding.jpg', '2022-08-08 13:52:16'),
(2, 'Second Post', 'This is Second post', 'second-post', 'Jinja is a web template engine for the Python programming language. It was created by Armin Ronacher and is licensed under a BSD License. Jinja is similar to the Django template engine but provides Python-like expressions while ensuring that the templates are evaluated in a sandbox. It is a text-based template language and thus can be used to generate any markup as well as source code.\r\n\r\nThe Jinja template engine allows customization of tags, filters, tests, and globals. Also, unlike the Django template engine, Jinja allows the template designer to call functions with arguments on objects. Jinja is Flask\'s default template engine and it is also used by Ansible, Trac, and Salt.', 'coding.jpg', '2022-08-07 16:27:21'),
(3, 'Third Post', 'This is third post', 'third-post', 'Python is a high-level, interpreted, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation.\r\n\r\nPython is dynamically-typed and garbage-collected. It supports multiple programming paradigms, including structured (particularly procedural), object-oriented and functional programming. It is often described as a \"batteries included\" language due to its comprehensive standard library.\r\n\r\nGuido van Rossum began working on Python in the late 1980s as a successor to the ABC programming language and first released it in 1991 as Python 0.9.0. Python 2.0 was released in 2000 and introduced new features such as list comprehensions, cycle-detecting garbage collection, reference counting, and Unicode support. Python 3.0, released in 2008, was a major revision that is not completely backward-compatible with earlier versions. Python 2 was discontinued with version 2.7.18 in 2020.', 'coding.jpg', '2022-08-07 16:27:21'),
(4, 'Fourth Post', 'This is fourth post', 'fourth-post', 'C (/ˈsiː/, as in the letter c) is a general-purpose computer programming language. It was created in the 1970s by Dennis Ritchie, and remains very widely used and influential. By design, C\'s features cleanly reflect the capabilities of the targeted CPUs. It has found lasting use in operating systems, device drivers, protocol stacks, though decreasingly[dubious – discuss] for application software. C is commonly used on computer architectures that range from the largest supercomputers to the smallest microcontrollers and embedded systems.\r\n\r\nA successor to the programming language B, C was originally developed at Bell Labs by Dennis Ritchie between 1972 and 1973 to construct utilities running on Unix. It was applied to re-implementing the kernel of the Unix operating system. During the 1980s, C gradually gained popularity. It has become one of the most widely used programming languages, with C compilers available for almost[citation needed] all modern computer architectures and operating systems. C has been standardized by ANSI since 1989 (ANSI C) and by the International Organization for Standardization (ISO).\r\n\r\nC is an imperative procedural language supporting structured programming, lexical variable scope, and recursion, with a static type system. It was designed to be compiled to provide low-level access to memory and language constructs that map efficiently to machine instructions, all with minimal runtime support. Despite its low-level capabilities, the language was designed to encourage cross-platform programming. A standards-compliant C program written with portability in mind can be compiled for a wide variety of computer platforms and operating systems with few changes to its source code.', 'coding.jpg', '2022-08-07 16:30:34'),
(5, 'Fifth Post', 'This is fifth post', 'fifth-post', 'Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. It is a general-purpose programming language intended to let programmers write once, run anywhere (WORA), meaning that compiled Java code can run on all platforms that support Java without the need to recompile. Java applications are typically compiled to bytecode that can run on any Java virtual machine (JVM) regardless of the underlying computer architecture. The syntax of Java is similar to C and C++, but has fewer low-level facilities than either of them. The Java runtime provides dynamic capabilities (such as reflection and runtime code modification) that are typically not available in traditional compiled languages. As of 2019, Java was one of the most popular programming languages in use according to GitHub, particularly for client–server web applications, with a reported 9 million developers.', 'coding.jpg', '2022-08-07 16:30:34'),
(6, 'Newest post 1', 'New post 1', 'sixth-post', 'This is the sixth post direct to database', 'coding.jpg', '2022-08-08 12:14:54'),
(8, 'Pagination', 'Pagination in flask', 'eigth-post', 'Pagination is the process in which a programmer builds a logic for accessing different pages on a website', 'coding.jpg', '2022-08-08 16:28:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
