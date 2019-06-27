// Assignment: Box It Script – Week 1
// Box a List of Words in The CLI
// In this homework, you will create a script that can take any number of arguments then outputs them inside boxes.

const BoxIt = {
    drawLine: function (num) {
        let string = "─";
        for (let i = 1; i < num; i++) {
            string += "─";
        }
        return string;
    },
    findSize: function (names) {
        let size = 0;
        for (var index in names) {
            if (names[index].length > size) {
                size = names[index].length;
            }
        }
        return size;
    },
    drawTopBorder: function (num) {
        let startCorner = "┌";
        let endCorner = "┐";
        let string = " ";
        let line = this.drawLine(num);
        string = startCorner + line + endCorner;
        return string;
    },
    drawMiddleBorder: function (num) {
        let startCorner = "├";
        let endCorner = "┤";
        let string = " ";
        let line = this.drawLine(num);
        string = startCorner + line + endCorner;
        return string;
    },
    drawBottomBorder: function (num) {
        let startCorner = "└";
        let endCorner = "┘";
        let string = " ";
        let line = this.drawLine(num);
        string = startCorner + line + endCorner;
        return string;
    },
    drawBarsAround: function (str, num) {
        return "│" + str.padEnd(num) + "│";
    },
    boxIt: function (str) {
        let num = this.findSize(str);
        console.log(this.drawTopBorder(num));
        for (let i = 0; i < str.length; i++) {
            console.log(this.drawBarsAround(str[i], num));
            if (i < str.length - 1) {
                console.log(this.drawMiddleBorder(num));
            }
        }
        console.log((this.drawBottomBorder(num)));
    },
}
var arguments = process.argv.slice(2);
BoxIt.boxIt(arguments);