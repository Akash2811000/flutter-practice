var express = require("express");
var router = express.Router();
const jwt = require("jsonwebtoken");
const config = require("../../authentication/global_config");

router.post('/',(req,res) => {
    let userdata = {
        username: req.body.username,
        password: req.body.password,
    };

    let token = jwt.sign(userdata,config.secretkey, {
        algorithm : config.algorithm,
        expiresIn : '1d'
    });

    if(userdata.username == "admin" && userdata.password == "admin"){
        res.status(200).json({
            message : "Login sucessfule",
            jwtoken:   token
        });
    }else{
        res.status(401).json({
                message: "login failed"
        })
    }
})


module.exports = router;