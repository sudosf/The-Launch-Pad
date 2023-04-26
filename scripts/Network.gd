extends Control

"""
	# global script for accessing variables from any scene and...
	# connecting to API endpoints for DB access.
"""

var request_complete: bool = false
var response # response data from API endpoints

# questions from DB
var multi_choice
var multi_response
var T_F # True/False
var short_ans # Short answer
var fill_blank # fill-in-the-blank

var http_request : HTTPRequest = HTTPRequest.new()
const SERVER_URL = "http://localhost:5000"

func _ready():
	randomize()
	add_child(http_request) # Connect our request handler:
	# warning-ignore: return_value_discarded
	http_request.connect("request_completed", self, "_http_request_completed")

func send_request(url): # simple get request
	var client = HTTPClient.new()
	# Make request to the server:
	var err_request = http_request.request(url)
	if err_request != OK: # Check if there were problems:
		printerr("HTTPRequest error: " + String(err_request))
		return

func _http_request_completed(_result, _response_code, _headers, _body):
	if _result != HTTPRequest.RESULT_SUCCESS:
		printerr("Error w/ connection: " + String(_result))
		return
	
	response = parse_json(_body.get_string_from_utf8())
	# print(_response_code)
	# print(response, "\n")
	request_complete = true

"""
	# Available endpoints to use 
"""
func getAll(): # get all questions data
	var url_endpoint = SERVER_URL + "/questions"
	send_request(url_endpoint)

func get_status():
	var url_endpoint = SERVER_URL + "/"
	send_request(url_endpoint) # request for DB status

func print_status():
	if (response['status'] == 1): 
		print("DB Status: Connected!", "\nMessage: " + response['message'])
	else: print("DB Status: Connection Failed.", "\nError: " + response['message'])
	request_complete = false # reset request check









