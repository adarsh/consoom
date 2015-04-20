class LineItemObserver < ActiveRecord::Observer
  def after_update(line_item)
    Activity.add(line_item.book_list.user_id, "LineItem", line_item)
  end
end
