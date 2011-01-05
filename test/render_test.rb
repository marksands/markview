require 'test/test_helper'

class RenderTest

  test "renders given file" do
    assert_equal GitHub::Markup.render(@argv, File.read(@argv)), Markview.render
  end

  test "renders discovered file" do
    discover_file
    assert_equal GitHub::Markup.render(@argv, File.read(@argv)), Markview.render
  end

  test "no markdown file given or found raises error" do
    bad_file
    assert_raises LoadError do
      Markview.render
    end
  end

  test "on GET to root" do
    get "/"
    should_respond_with_success
  end

end

# test "renders given file" do
#   GitHub::Markup.render(@argv, File.read(@argv)).should_equal 
#     Markview::Application.markview_me
# end