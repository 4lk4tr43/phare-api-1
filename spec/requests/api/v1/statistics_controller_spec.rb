# frozen_string_literal: true

require "swagger_helper"

RSpec.describe Api::V1::Public::StatisticsController do
  path "/api/v1/pub/pages/{id}/statistics" do
    get "get statistics of page" do
      deprecated true
      produces "application/json"
      parameter name: :id, in: :path, type: :string

      response "200", "page found" do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              day: { type: :string },
              mpf: { type: :number },
              fmp: { type: :number },
              fci: { type: :number },
              fcp: { type: :number },
              si: { type: :number },
              ia: { type: :number }
            }
          }

        let(:id) { FactoryBot.create(:page).id }
        run_test!
      end

      response "404", "page not found" do
        let(:id) { "invalid" }
        run_test!
      end
    end
  end
end
