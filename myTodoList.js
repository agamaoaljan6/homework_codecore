const readline = require('readline');
const fs = require('fs');




let rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});


let myList = [ ];
let ongoing = '[ ]';
let print = console.log;

print("\nWELCOME TO TODO LIST CLI!\n-------------------------------------")

function todo() {
    rl.question(
        '\n(v) View • (n) New • (c) Complete • (d) Delete • (q) Quit\n', (myItems) => {
            switch (myItems[0]) {
                case 'q':
                    rl.close();
                    print('See you next time!')
                    break;
                case 'n':
                    function addList() {
                        rl.question('What are your plans today?\n>', (addItems) => {
                            let myItems = {};
                            myItems.name = addItems;
                            myItems.ongoing = false;
                            myList.push(myItems);
                            print(`Added ${addItems} to the list!`)
                            todo();
                        })
                    }
                    addList();
                    break;
                case 'c':
                        function compList() {
                            if (myItems[1] === undefined) {
                                print('You want to mark something?')
                                todo();  
                            } else {
                                let e = parseInt(myItems[1]);
                                myList[e].finished = '[√]';
                                print(`Nice job! ${myList[e].name} is DONE!!`)
                                todo();    
                            }
                            }
                    compList();
                    break;
                case 'd':
                    function delItem(e) {
                        if (myItems[1] === undefined) {
                            print('You want to delete something?')
                            todo();  
                        } else {
                            let e = parseInt(myItems[1]);
                            print(`Guess you don't need ${myList[e].name} anymore. DELETED!`)
                            myList.splice(e,1);
                            todo();
                        }
                    }
                    delItem(0);
                    break;
                case 'v':
                    function viewList() {
                        if (myList === undefined || myList.length == 0) {
                            print('YOUR LIST IS EMPTY, ADD SOME NOW!\n')
                        } else {
                            print(`\nWhat are you going to do with this list?\n`)
                            for (let i = 0; i < myList.length; i++) {
                                if (marker = myList[i].finished) {
                                    print(`${i} ${marker} ${myList[i].name}`);
                                } else {
                                    print(`${i} ${ongoing} ${myList[i].name}`);
                                }
                            }
                        }
                        todo();
                    }
                    viewList();
                    break;
                default:
                    print('Press any menu key')
                    todo();
                    break;
            }
        })
}
todo();