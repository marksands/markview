require 'test/test_helper'

class RenderTest
  
  test "renders given file" do
    assert_equal GitHub::Markup.render(@argv, File.read(@argv)), Markview::Application.markdown_me
  end

  test "renders discovered file" do
    discover_file
    assert_equal GitHub::Markup.render(@argv, File.read(@argv)), Markview::Application.markdown_me    
  end

  test "no markdown file given or found raises error" do
    bad_file
    assert_raises LoadError do
      Markview::Application.markdown_me
    end
  end
  
  test "on GET to root" do
    get "/"
    should_respond_with_success
  end

end