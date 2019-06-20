# homework_codecore
CODECORE Homework REPO


WEEK #1 - BOX IT SCRIPT

Box a List of Words in The CLI
In this homework, you will create a script that can take any number of arguments then outputs them inside boxes.

A short disclaimer about the examples, the output will look much better in your terminal. Here are examples of it in action:

$ node boxit.js 'Jon Snow' 'Cersei Lannister' 'Daenerys Targaryen'
┏━━━━━━━━━━━━━━━━━━┓
┃Jon Snow          ┃
┣━━━━━━━━━━━━━━━━━━┫
┃Cersei Lannister  ┃
┣━━━━━━━━━━━━━━━━━━┫
┃Daenerys Targaryen┃
┗━━━━━━━━━━━━━━━━━━┛
$ node boxit.js 'Jon Snow'
┏━━━━━━━━┓
┃Jon Snow┃
┗━━━━━━━━┛
$ node boxit.js
┏┓
┗┛
Here's a screenshot of what it should look like in your terminal.



You will need special characters to "draw" the box. You can find them listed in this Wikipedia article. To use them, you can copy & paste them where needed.

Breaking It Down
drawLine Function
Write a drawLine function that takes a number as an argument that returns that number of horizontal bars (i.e. ━) as a string.

Example usage:

drawLine(4) // returns '━━━━'
drawLine(8) // returns '━━━━━━━━'
drawTopBorder, drawMiddleBorder and drawBottomBorder Functions
Write three functions: drawTopBorder, drawMiddleBorder and drawBottomBorder. Each function should take a number, return a line of length including corner pieces. You can make use of drawLine to implement these functions.

Example usage:

drawTopBorder(4) // returns '┏━━━━┓'
drawTopBorder(0) // returns '┏┓'

drawMiddleBorder(8) // returns '┣━━━━━━━━━┫'
drawMiddleBorder(0) // returns '┣┫'

drawBottomBorder(2) // returns '┗━━┛'
You will need special characters to "draw" the box. You can find them listed in this Wikipedia article. To use them, you can copy & paste them where needed.

drawBarsAround Function
Write a drawBarsAround function that takes a string, surrounds it with vertical lines then returns it.

Example usage:

drawBarsAround("My name is Dan") // returns "┃My name is Dan┃"
drawBarsAround("You are Jane  ") // returns "┃You are Jane  ┃"
drawBarsAround("  You are Bill") // returns "┃  You are Bill┃"
boxIt Function
Write a boxIt function that takes an array of strings and returns a string where each is in a single column table. To add "new lines" to a string, use the \n special character. In a string, \n characters will display as new lines when logged with console.log(...).

Try using the functions you've built previously (e.g. drawBottomBorder, drawBottomBorder, etc) to help you implement this function.

Example usage:

boxIt(['Jon Snow', 'Cersei Lannister'])
// returns...
// '┏━━━━━━━━━━━━━━━━┓\n┃Jon Snow        ┃\n┣━━━━━━━━━━━━━━━━┫\n┃Cersei Lannister┃\n┗━━━━━━━━━━━━━━━━┛'

// When logged, the '\n' appear as new lines...
console.log(boxIt(['Jon Snow', 'Cersei Lannister']))

┏━━━━━━━━━━━━━━━━┓
┃Jon Snow        ┃
┣━━━━━━━━━━━━━━━━┫
┃Cersei Lannister┃
┗━━━━━━━━━━━━━━━━┛

boxIt(['Jon Snow']) // returns '┏━━━━━━━━┓\n┃Jon Snow┃\n┗━━━━━━━━┛'

// when logged, appears as...
console.log(boxIt(['Jon Snow']))

┏━━━━━━━━┓
┃Jon Snow┃
┗━━━━━━━━┛

$ node boxit.js // returns '┏┓\n┗┛'
Piecing It All Together
Turn your file into a script allowing anyone to use it from the command line (i.e. bash) as follows:

$ node boxit.js 'Jon Snow' 'Cersei Lannister' 'Daenerys Targaryen'
┏━━━━━━━━━━━━━━━━━━┓
┃Jon Snow          ┃
┣━━━━━━━━━━━━━━━━━━┫
┃Cersei Lannister  ┃
┣━━━━━━━━━━━━━━━━━━┫
┃Daenerys Targaryen┃
┗━━━━━━━━━━━━━━━━━━┛
$ node boxit.js 'Jon Snow'
┏━━━━━━━━┓
┃Jon Snow┃
┗━━━━━━━━┛
$ node boxit.js
┏┓
┗┛
