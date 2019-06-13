class Grid { // created a grid to visualize the 5 by 5 grid more clearly
    constructor(x, y) {
        this.x = x
        this.y = y
        this.cells = [];
        for (let i = 0; i < x; i++) {
            var row = [];
            for (let j = 0; j < y; j++) {
                row.push({
                    'turtleHasBeenHere': false
                });
            };
            this.cells.push(row);
        }
    }
    draw() { // draw method will allow us to DRAW the turtle's movement 
        for (let i = this.x - 1; i >= 0; i--) {
            let string = "";
            for (let j = 0; j < this.y; j++) {
                if (this.cells[i][j].turtleHasBeenHere === true) {
                    string += '•'; // if the turtle is present in the grid print this
                } else {
                    string += ' '; // otherwise print this
                }
            }
            console.log(string)
        }
    }
    addTurtleLocation(x, y) {
        this.cells[y][x].turtleHasBeenHere = true;
    }
}
class Turtle {
    constructor(x, y) {
        this.x = x;
        this.y = y;
        this.direction = 0; // this.direction is where i'm storing the direction of the turtle
        this.grid = new Grid(6, 6);
        this.grid.addTurtleLocation(x, y);
    }
    right() {
        this.direction += 1;
        this.direction = this.direction % 4;
        if (this.direction < 0) {
            this.direction += 4;
        }
        return this;
    }
    left() {
        this.direction -= 1;
        this.direction = this.direction % 4;
        if (this.direction < 0) {
            this.direction += 4;
        }
        return this;
    }
    allPoints() {
        switch(this.direction){ 
            case 0:
                this.y++; // changes the location of our turtle by +1 in the y axis
                if(this.y == this.grid.y) {
                    this.y = this.grid.y - 1;
                }
                this.grid.addTurtleLocation(this.x, this.y); //Just add it on the list like a trail.

                break;
            case 1: 
                this.x++; // changes the location of our turtle by +1 in the x axis
                if(this.x == this.grid.x) {
                    this.x = this.grid.x - 1;
                }
                this.grid.addTurtleLocation(this.x, this.y);
                break;
            case 2: 
                this.y--;
                if(this.y < 0) {
                    this.y = 0;
                }
                this.grid.addTurtleLocation(this.x, this.y);
                break;
            case 3: 
                this.x--;
                if(this.x < 0) {
                    this.x = 0;
                }
                this.grid.addTurtleLocation(this.x, this.y);
                break;
            default:
                return this;
        }
        return this;
    }
    forward (distance) { // forward method tells us where the turtle is looking 
        for (let i=0; i < distance; i++) { // distance means how FAR you go
            this.allPoints();
        }
        return this;
    }
    print(){ // prints the whole trail of the turtle when you call it
        this.grid.draw();
    }
}

let turtle = new Turtle(0,0);
turtle
.forward(5)
.right()
.forward(5)
.right()
.forward(5)
.right()
.forward(5)
.print()