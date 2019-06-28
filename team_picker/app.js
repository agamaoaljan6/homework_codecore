const express = require("express");
const logger = require("morgan");
const cohortsRouter = require("./routes/cohorts");
const moment = require('moment')
const app = express();
const methodOverride = require("method-override")


app.use(logger("dev"));
app.set("view engine", "ejs");
app.use(express.urlencoded({ extended: true}))

app.get("/", (req, res)=>{
    res.render('home')
});


app.use(                                    
    methodOverride((req, res) => {
      if (req.body && req.body._method) {
        const method = req.body._method;
        return method;
      }
  }),
);


app.use('/cohorts', cohortsRouter);

const PORT = 1234;
const ADDRESS = "localhost";
app.listen(PORT, ADDRESS, () => {
  console.log(`Server up on http://${ADDRESS}:${PORT} : ${moment().format()}`);
});