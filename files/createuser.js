c = new Mongo();
db = c.getDB("admin");

db.createUser({"user":"admin",
               "pwd":"admin",
               "roles":[
                       {"role":"readWriteAnyDatabase","db":"admin"},
                       {"role":"userAdminAnyDatabase","db":"admin"},
                       {"role":"dbAdminAnyDatabase","db":"admin"},
                       {"role":"clusterAdmin","db":"admin"}]});
