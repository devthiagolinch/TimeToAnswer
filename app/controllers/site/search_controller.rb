class Site::SearchController < SiteController
    def question
        @questions = Question.includes(:answers).page(params[:page])
    end
end
