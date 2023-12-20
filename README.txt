User Dashboard PoC Using Apache FreeMarker and Python


Overview

This Proof of Concept demonstrates the integration of Apache FreeMarker with Python for generating dynamic web content. Specifically, it showcases the creation of a User Dashboard that visualizes data through interactive charts.

Key Features

Apache FreeMarker Integration: Utilizes FreeMarker templates for HTML generation.
Data Visualization: Implements Chart.js to render pie charts based on user data.
Python Scripting: Processes data and generates the final HTML using Jython.


Prerequisites

Jython 2.7.x
Apache FreeMarker


Setup and Execution

Run the Script: In the project directory, execute jython data_layer.py. This generates a dashboard.html file that can be viewed in a web browser.


Project Structure

data_layer.py: Python script for processing and visualizing data.
template.ftl: FreeMarker template for HTML generation.
generated.json: Sample data in JSON format.
lib/: Contains freemarker.jar and other dependencies.


Understanding the PoC

The Python script reads data from generated.json, calculates distributions, and passes the results to the FreeMarker template.
FreeMarker processes the template.ftl file, dynamically inserting data into the HTML structure.
The generated dashboard.html displays interactive charts based on the provided data.