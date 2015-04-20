class FriendshipObserver < ActiveRecord::Observer
  def after_update(friendship)
    if friendship.status == "accepted"
      activity = Activity.
        find_by_source_type_and_source_id("Friendship", friendship)

      if activity.present?
        activity.touch
      else
        Activity.add(friendship.user_id, "Friendship", friendship)
      end
    end
  end

  def after_create(friendship)
    Activity.add(friendship.user_id, "Friendship", friendship)
  end
end
