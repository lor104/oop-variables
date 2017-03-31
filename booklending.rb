

class Book

  attr_accessor :due_date, :checkout, :due_date

  @@on_shelf = [] #will contain the collection of book objects that are available to be lent out
  @@on_loan =  [] #will contain the collection of books that are currently being borrowed
  @@borrow_date = nil
  @@due_date = nil

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def borrow
    if @@on_loan.include?(@title) == true
      puts "#{@title} is already on loan"
    else
      @@on_loan << self
      @@on_shelf.delete(self)
      time = Time.now
      @@borrow_date = time.day
    end
  end

  def return_to_library
    if self.lent_out? == true
      @@on_loan.delete(self)
      @@on_shelf << self
      @@due_date = nil
      @@borrow_date = nil
      puts "#{@title} is now returned"
      return @@on_loan
    else
      "#{@title} is not on loan"
    end
  end

  def lent_out?
    if @@on_loan.include?(self) == true
      puts "#{@title} is lent out"
      return true
    else
      puts "#{@title} is not lent out"
      return false
    end
  end

  def self.create(title, author, isbn)
    book = Book.new(title, author, isbn)
    @@on_shelf << book
    return book
  end

  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end

  def self.browse
    @@on_shelf.sample
  end

  def self.current_due_date
    @@due_date = @@borrow_date + 3
  end

end
#
# lotr = Book.create(:lotr, :tolkein, :"258713")
#
# puts lotr.inspect
# lotr.borrow
# puts lotr.inspect
# Book.current_due_date
