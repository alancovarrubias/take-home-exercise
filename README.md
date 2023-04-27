CLI RPN Calculator
===================

Description
-----------------

This Ruby project implements a calculator which uses Reverse Polish Notation (RPN), a mathematical notation in which operators follow their operands instead of preceding them.

Guidelines
==================

Specifications
--------------

1. The calculator uses standard input and standard output.
2. The calculator implements the four standard arithmetic operators `+`, `-`, `*`, `/`.
3. The calculator handles errors and recovers gracefully.
4. The calculator exits when it receives a `q` command or an end of input indicator (EOF / Ctrl+D).

Installation
--------------

Clone this respository to your local filesystem.
Ensure Ruby 2.7 or higher is installed on your system.
Run this command `ruby rpn_runner.rb` to get CLI running.

Instructions
--------------
Begin typing integers or floats into the CLI followed by any valid operators.
Any invalid characters will return an 'Invalid expression' message.
Not having enough operands to perform an operation will return a 'Not enough operands' message.
Dividing by zero will return a 'Divide by zero' message.
To exit the CLI, you can either enter q as input or use an end of input indicator (EOF / Ctrl+D).

Architectural Decisions
==================

Development Methodologies
-----------------

Following the Test-Driven Development (TDD) methodology, this project's tests were written before the actual implementation. This approach ensures that the Command Line Interface (CLI) functions to the extent covered by the tests.

Error Handling
-----------------

We created a custom exception for RPN calculator errors, allowing us to handle them uniquely and provide a better user experience by displaying the appropriate error message.

Maintainability
-----------------

To facilitate future updates, we decoupled the RPN CLI logic from the RPN Input Parser. These two classes are linked using constructor injection in the runner.rb file. By decoupling the input source from the calculator logic, we gain the flexibility to change the input source without affecting the core calculator functionality.

Future Work
-----------------

1. There still exists some coupling between the two. Our custom exception should be made more general in order to handle any exception that needs to be caught and display the corresponding error message to the user.
2. To improve the modularity of our tests, we should also avoid direct references to the Input Parser in our CLI tests. Instead we should use a mock object that returns a predefined value or throws an exception, allowing us to test the CLI in isolation.
3. To ensure that our implementation is robust, we should create additional tests to cover any possible edge cases we encounter. Only then can we be confident that our calculator can handle any unexpected input or scenarios that may arise during its use.