let jwt = require("jsonwebtoken");
const config = require('./global_config');

function veryfytoken(req, res, next) {
    var token = req.headers["x-access-token"];

    jwt.verify(
        token,
        config.secretkey,
        {
            algorithms: config.algorithm,
        },
        function (err, decoded) {
            if (err) {
                let errordata = {
                    message: err.message,
                    expirAt: err.expirAt,
                };
                console.log(errordata);
                return res.status(401).json({
                    message: "unauthorised access"
                });

            }

            req.decoded = decoded;
            console.log(decoded);
            next();
        }
    );
}

module.exports = veryfytoken;