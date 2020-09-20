##
# Just like RSpec::ExampleGroups is a class
class ExampleGroup
  def self.it(desc, &block)
    define_method(desc, &block)
    @examples ||= []
    @examples << desc
  end

  def self.examples
    @examples
  end
end

##
# When we describe something in rspec
# Is like we are inhering from ExampleGroups
class ArraySpec < ExampleGroup
  def build_array(*args)
    [*args]
  end

  it "has a length" do
    raise unless build_array("a").length == 1
  end

  it "has a first element" do
    raise unless build_array("a").first == "a"
  end
end

##
# And this is how you run all examples
ArraySpec.examples.each do |example|
  begin
    ArraySpec.new.send(example)
    puts "#{example}: PASS"
  rescue => e
    puts "#{example}: FAIL (#{e.message})"
  end
end

# The code above is equivalent to this:

# RSpec.describe 'an array' do
#     def build_array(*args)
#         [*args]
#     end
#
#     it 'has a length' do
#         raise unless build_array("a").length == 1
#     end
#
#     it 'has a first element' do
#         raise unless build_array("a").first == "a"
#     end
# end
