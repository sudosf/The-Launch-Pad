extends Control

"""
	# global script for accessing variables from any scene and...
	# connecting to API endpoints for DB access.
"""

var request_complete: bool = false
var response # response data from API endpoints

var http_request : HTTPRequest = HTTPRequest.new()
const SERVER_URL = "https://tlp-api.onrender.com"

var error_status = "OK" # status code to detect server errors

func _ready():
	# randomize()
	add_child(http_request) # Connect our request handler:
	http_request.connect("request_completed", self, "_http_request_completed")

func send_request(url): 
	# Make request to the server:
	var err_request = http_request.request(url)
	if err_request != OK: # Check if there were problems:
		printerr("HTTPRequest error: " + String(err_request))
		error_status = "HTTPRequest error"
		Global.custom_change_scene("res://final/scenes/error.tscn")
		return

func _http_request_completed(_result, _response_code, _headers, _body):
	error_status = str(_response_code)
	if _result != HTTPRequest.RESULT_SUCCESS:
		printerr("Error w/ connection: " + String(_result))
		
		Global.custom_change_scene("res://final/scenes/error.tscn")
		return

	if (_response_code != 200):
		printerr("Error w/ connection: " + String(_result))
		print("Network status code: ", _response_code)
		
		Global.custom_change_scene("res://final/scenes/error.tscn")
		return
	
	response = parse_json(_body.get_string_from_utf8())
	print("Network status code: ", _response_code)
	# print(response, "\n")
	request_complete = true

"""
	# Available endpoints to use 
"""
func get_questions(type):
	var endpoint = SERVER_URL + "/questions/types/" + type
	send_request(endpoint)

func get_all_questions(): # get all questions data
	var endpoint = SERVER_URL + "/questions"
	send_request(endpoint)

func get_status():
	var endpoint = SERVER_URL + "/"
	send_request(endpoint)

func print_status():
	if (response['status'] == 1): 
		print("DB Status: Connected to database!", "\nMessage: " + response['message'])
	else: print("DB Status: Connection Failed.", "\nError: " + response['message'])
	request_complete = false # reset request check









