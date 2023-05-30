require "test_helper"

class AgentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agent = agents(:one)
  end

  test "should get index" do
    get agents_url, as: :json
    assert_response :success
  end

  test "should create agent" do
    assert_difference("Agent.count") do
      post agents_url, params: { agent: { avatar: @agent.avatar, email: @agent.email, name: @agent.name, phone_number: @agent.phone_number, property_id: @agent.property_id } }, as: :json
    end

    assert_response :created
  end

  test "should show agent" do
    get agent_url(@agent), as: :json
    assert_response :success
  end

  test "should update agent" do
    patch agent_url(@agent), params: { agent: { avatar: @agent.avatar, email: @agent.email, name: @agent.name, phone_number: @agent.phone_number, property_id: @agent.property_id } }, as: :json
    assert_response :success
  end

  test "should destroy agent" do
    assert_difference("Agent.count", -1) do
      delete agent_url(@agent), as: :json
    end

    assert_response :no_content
  end
end
