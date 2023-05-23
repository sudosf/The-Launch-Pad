extends Control

"""
	# global script for accessing variables from any scene and...
	# connecting to API endpoints for DB access.
"""

var request_complete: bool = false
# var response_collected: bool = false
# var is_requesting: bool = false

var response # response data from API endpoints

var http_request : HTTPRequest = HTTPRequest.new()
const SERVER_URL = "http://localhost:5000"

# var request_queue: Array = [] # hold all requests

func _ready():
	randomize()
	add_child(http_request) # Connect our request handler:
	# warning-ignore: return_value_discarded
	http_request.connect("request_completed", self, "_http_request_completed")

#func _process(delta):
#	if is_requesting:
#		return
#	if request_queue.empty() and response_collected:
#		response_collected = false
#		return
#
#	is_requesting = true
#	send_request(request_queue.pop_front())

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
	print(_response_code)
	# print(response, "\n")
	request_complete = true
	# is_requesting  = false

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









