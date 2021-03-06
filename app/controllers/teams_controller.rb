class TeamsController < ApplicationController
  after_filter :set_content_type

  def index
    @teams=Team.all
    render json: @teams.to_json(only: [:country, :alternate_name, :fifa_code, :group_id]), :callback => params['callback']
  end

  def results
    @teams=Team.all
    render json: @teams.to_json(except: [:id, :created_at]), :callback => params['callback']
  end

  def new_results
    @teams = Team.all
    render 'team_results.json.rabl'
  end

   def group_results
    @groups = Group.all
    render 'group_results.json.rabl'
  end
end
