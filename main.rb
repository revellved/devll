# frozen_string_literal: true

require './devll.rb'

class Name < Devll
  # Str @@null = "THIS"
  Str! @value = ""
end

class Person < Devll
  new_type :Name, Name

  Str! @name  = xXx
  Int! @reps  = xXx
  Str @@delim = "|"
  Arr @@new = ["a", "b", 2]
  # Map(Sym, Arr(Str)) @nnew = ["|"]

  def hello
    p "hello"
  end
  def bye
    p "bye"
  end

  def hi
    # local = 2
    # panic sexp: /(delim|cmx)/
    # binding.irb
    # pp Str @he
    # Str @he
    defer :hello
    defer :bye
    defer :bye
    # panic "dsa"
    p "#{@@delim} Oh, (#{@@new}) hi #{@name} #{@@delim} " * @reps
  end

  def hi2; Str! name
    p "hello #{name}"
  end
end

man = Person.new("Mark", 2)
# man.hi
# man.hi2 "oleg"
