Given /^I have added the following books as favorites:$/ do |table|
  book_list =  BookList.create!(user_id: 1)

  table.hashes.each do |attributes|
    book = Book.create!(attributes)
    LineItem.create!(book_list:  book_list,
                     book:       book,
                     blurb:      "blurb#{book.id}")
  end
end


Then /^I should see all the books and authors in the database$/ do
  Book.all.each do |book|
    step %{I should see "#{book.title}"}
    step %{I should see "#{book.author}"}
  end
end

Then /^I should see an Amazon Buy Now button$/ do
  page.should have_xpath("//img[@src=\"/assets/buy_from_amazon_button_yellow.gif\"]")
end

Then /^when I click one, it should take me to an Amazon\.com link$/ do
  # step %{find("img[@alt='Buy_from_amazon_button_yellow']").click}
  find("img[@alt='Buy_from_amazon_button_yellow']").click
end
