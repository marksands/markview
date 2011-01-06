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
    Proc.new {
      assert_raise LoadError do
        require 'markview.rb'
      end
    }
  end

  test "on GET to root" do
    get "/"
    should_respond_with_success
  end

end