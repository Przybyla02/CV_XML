from lxml import etree

xml_base_path = "cv{}.xml"
xsl_base_path = "cv{}.xsl"
html_base_path = "cv{}.html"

for i in range(1, 3):
    xml_path = xml_base_path.format(i)
    xsl_path = xsl_base_path.format(i)
    html_path = html_base_path.format(i)

    with open(xml_path, 'r', encoding='utf-8') as xml_file:
        xml_data = xml_file.read()

    with open(xsl_path, 'r', encoding='utf-8') as xsl_file:
        xsl_data = xsl_file.read()

    xml_tree = etree.XML(xml_data.encode('utf-8'))
    xsl_tree = etree.XML(xsl_data.encode('utf-8'))
    transform = etree.XSLT(xsl_tree)
    html_result = transform(xml_tree)

    with open(html_path, "w", encoding="utf-8") as html_file:
        html_file.write(str(html_result))

html_base_path.format("{1-2}")
