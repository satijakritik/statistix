# Statistix - A Statistical Programming Language

Statistix is a simple programming language designed for statisticians and data analysts. It provides a user-friendly environment for performing statistical calculations. With Statistix, you can quickly and easily work with data to generate insights and draw meaningful conclusions.

## Features

- Intuitive syntax: Statistix's syntax is designed to be easy to learn and use, making it accessible to both beginners and experienced statisticians.
- Built-in statistical functions: Statistix comes with a wide range of built-in statistical functions and libraries to streamline complex calculations.
- Extensible: You can extend Statistix's functionality by adding custom functions and libraries.
- Interactive mode: Experiment with code in real-time using the interactive mode.

## Installation

To use Statistix, you'll need to install the interpreter on your system. Here's how you can get started:

1. Clone the StatLang repository to your local machine:

   ```
   git clone https://github.com/satijakritik/statistix.git
   ```

2. Build the interpreter

   ```
   cd statistix
   dune build
   ```

3. Run the interpreter

   1. Interactive Mode

   ```
   dune exec --statistix
   ```

   2. Command mode
  
   ```
   dune exec --statistix [expression]
   ```

   3. File Interpreter
  
   ```
   dune exec --statistix [-f] [file_name]
   ```
   


