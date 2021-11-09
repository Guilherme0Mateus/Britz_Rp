fx_version 'adamant'
game 'gta5'

files {
	"data/viaturas1/handling.meta",
	"data/viaturas1/vehicles.meta",
	"data/viaturas1/carvariations.meta",
	"data/viaturas2/handling.meta",
	"data/viaturas2/vehicles.meta",
	"data/viaturas2/carvariations.meta"
}


data_file "HANDLING_FILE" "data/viaturas1/handling.meta"
data_file "VEHICLE_METADATA_FILE" "data/viaturas1/vehicles.meta"
data_file "VEHICLE_VARIATION_FILE" "data/viaturas1/carvariations.meta"
data_file "HANDLING_FILE" "data/viaturas2/handling.meta"
data_file "VEHICLE_METADATA_FILE" "data/viaturas2/vehicles.meta"
data_file "VEHICLE_VARIATION_FILE" "data/viaturas2/carvariations.meta"


client_script 'vehicle_names.lua'