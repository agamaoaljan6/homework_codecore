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
    draw() {
        for (let i = this.x - 1; i >= 0; i--) {
            let string = "";
            for (let j = 0; j < this.y; j++) {
                if (this.cells[i][j].turtleHasBeenHere === true) {
                    string += '•';
                } else {
                    string += ' ';
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
        this.direction = 0;
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
}