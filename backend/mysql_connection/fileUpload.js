const fs = require("fs")


var handle_file_upload = function (req,newname,path){

    return new Promise((resolve,reject)=>{
        var src = fs.createReadStream(req.file.path)
        var dest = fs.createWriteStream(path+newname)
        src.pipe(dest)
        
        src.on("end",function (){
            fs.unlinkSync(req.file.path)
            //console.log("uploading image..."+req.file.path.toString());

            resolve("OK")
        })

        src.on("error",function(){
            reject("ERR")
        })
    })
}


module.exports = handle_file_upload