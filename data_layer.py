from __future__ import print_function
import json
from collections import Counter
from java.io import File, StringWriter
from freemarker.template import Configuration, TemplateExceptionHandler


def calculate_distribution(data, key):
    counts = Counter(user[key] for user in data)
    total = len(data)
    return {k: (v / total * 100) for k, v in counts.items()}

def main():
    try:
        # Load the JSON data
        with open('generated.json', 'r') as f:
            data = json.load(f)

        # Calculating distributions
        eye_color_distribution = calculate_distribution(data, 'eyeColor')
        is_active_distribution = calculate_distribution(data, 'isActive')
        gender_distribution = calculate_distribution(data, 'gender')

        # Configure FreeMarker
        cfg = Configuration(Configuration.VERSION_2_3_31)
        cfg.setDirectoryForTemplateLoading(File("."))
        cfg.setDefaultEncoding("UTF-8")
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER)
        cfg.setLogTemplateExceptions(False)
        cfg.setWrapUncheckedExceptions(True)
        cfg.setFallbackOnNullLoopVariable(False)

        # Get the template
        template = cfg.getTemplate("template.ftl")

        # Data model
        data_model = {
            "users": data,
            "eyeColorData": json.dumps(eye_color_distribution),
            "isActiveData": json.dumps(is_active_distribution),
            "genderData": json.dumps(gender_distribution)
        }

        # Process the template
        output = StringWriter()
        template.process(data_model, output)

        # Save the output to an HTML file
        with open("dashboard.html", "w") as f:
            f.write(output.toString())

    except Exception as e:
        print("An error occurred: {0}".format(e))

if __name__ == "__main__":
    main()
