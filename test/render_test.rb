require 'contest'
require 'vegas'
require 'markview'

class RenderTest < Test::Unit::TestCase
  
  test "renders given file" do
    ARGV[0] = 'README.md'
    assert_equal RDiscount.new(File.read(ARGV[0])).to_html, Markview::Application.markdown_me
  end
  
  test "renders discovered file" do
    ARGV[0] = Dir.glob("*.{md,markdown}")[0]
    assert_equal RDiscount.new(File.read(ARGV[0])).to_html, Markview::Application.markdown_me    
  end
  
  test "no markdown file given or found raises error" do
    ARGV[0] = "bad_file_name"
    assert_raises LoadError do
      Markview::Application.markdown_me
    end
  end
  
  test "Vegas runs application" do
    pid = fork { Vegas::Runner.new(Markview::Application, 'markview', :foreground => true, :skip_launch => true, :debug => true) }
    sleep(1)
    Process.detach(pid)
    Process.kill( 'HUP', pid)
  end
  
end