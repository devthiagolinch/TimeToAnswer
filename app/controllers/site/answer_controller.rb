class Site::AnswerController < SiteController
    def question
        #@answer = Answer.find(params[:answer_id])
        #UserStatistic.set_statistic(@answer, current_user)

        redis_answer = Rails.cache.fetch(params[:answer_id]).split('@@')
        @question_id = redis_answer.first
        @correct = ActiveModel::Type::Boolean.new.cast(redis_answer.last)
        UserStatistic.set_statistic(@correct, current_user)
    end

    private
end