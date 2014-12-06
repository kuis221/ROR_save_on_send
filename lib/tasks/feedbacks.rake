namespace :feedbacks do
  desc 'Migrate feedback from recent transaction model'
  task migrate_from_recent_transaction: :environment do
    User::RecentTransaction.all.each do |recent_transaction|
      if recent_transaction.feedback.nil?
        recent_transaction.create_feedback(
          comments: recent_transaction.comments,
          service_quality: recent_transaction.service_quality,
          user: recent_transaction.user,
          created_at: recent_transaction.created_at,
          updated_at: recent_transaction.updated_at
        )
      end
    end
  end
end
