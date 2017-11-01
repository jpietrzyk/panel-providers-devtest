shared_context :json_content do
  let(:json_content) do
    <<-JSON
      {
        "a": ["123", "abcd",1,3,1,12,21,11,[1,2,3,4,5,"a","b","c",11,2,3],21,23,1,2,3],
        "b": [1,2,3],
        "c": {
          "aa": ["123", "abcd",1,3,1,12,21,11,[1,2,3,4,5,"a","b","c",11,2,3],21,23,1,2,3],
          "bb": "Foo Bar Bazz Foo Bar Baz",
          "cc": [
            {
              "aaa": [1,2,3,15,"foo", "foo", 22, "xyz",12,3,4,5,6]
            }
          ]
        }
      }
    JSON
  end
end

shared_context :html_content do
  let(:html_content) do
    <<-HTML
      <!DOCTYPE html>
      <html>
        <head>
          <title>Foo abc</title>
        </head>
        <body>
          <div>Bar abcd baaz</div>
          <p><a href="foo.html">Link to a</a></p>
        </body>
      </html>
    HTML
  end
end
