# If we have these two methods:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

#and

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?

# Both pieces of code produce the same result. In the first example, 
# we are setting the value of the instance variable directly, hence 
# there is no really a need for an attr_accessor, just an attr_reader which
# is used on line 11 without self as it's not needed. In the second example,
# we are using both are attr_accessor methods, on line 21 to set instance 
# variable `@template` using the setting method and on line 25 to retrieve
# the value of the instance variable using the getter method. However, on line
# 21 we don't need to use self. 
