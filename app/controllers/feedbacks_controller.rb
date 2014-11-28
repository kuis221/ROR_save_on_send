class FeedbacksController < ApplicationController
  before_filter :authenticate_user!

  def create
    feedback_attrs = params.require(:feedback)
      .permit(:comments, :service_quality, :commendable_id, :commendable_type)    
  
    feedback = current_user.feedbacks.create(feedback_attrs)

    if(feedback.commendable.is_a?(ServiceProvider))
      redirect_to(
        service_provider_path(feedback.commendable), notice: I18n.t('notice.thanks_for_feedback')
      )
    end
  end
end
