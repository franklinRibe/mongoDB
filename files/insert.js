c = new Mongo()
db = c.getDB("admin");
//db.auth({"user":"admin","pwd":"admin"})
db = c.getDB("indice");

var arr = [];

for (var i=0; i<100000; i++){
  arr.push({"_id":i,"object":i,"Object2":i,"Object3":i});
}
print("===== Iniciando Importação de Documentos =====");
db.exemplo.insertMany(arr,{"ordered":true,"writeConcern":{"w":0,"j":0}})
