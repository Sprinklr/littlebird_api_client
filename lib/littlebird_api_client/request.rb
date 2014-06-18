module LittleBird
  module Request
    def base_url
      "http://#{@base_url}/#{@version}/"
    end

    def endpoints
      {
        v1:
          {
            compare_twitter_screen_name: "compare/twitter_screen_name",
            content_top: "content/top",
            content_recent: "content/recent",
            graph_add: "graph/add",
            graph_analyze: "graph/analyze",
            graph_clear_attribute: "graph/clear_attribute",
            graph_community: "graph/community",
            graph_create: "graph/create",
            graph_download: "graph/download",
            graph_drop: "graph/drop",
            graph_import: "graph/import",
            graph_info: "graph/info",
            graph_metric: "graph/metric",
            graph_list: "graph/list",
            graph_list_attribute: "graph/list_attribute",
            graph_set_attribute: "graph/set_attribute",
            identity_lookup: "identity/lookup",
            influencer_discover: "influencer/discover",
            influencer_lookup: "influencer/lookup",
            misc_screen_name_lookup: "misc/screen_name_lookup",
            info_topology: "info/topology",
            topic_search: "topic/search"
          }
      }[@version]
    end

    def endpoint_http_methods
      {
        v1:
          {
            compare_twitter_screen_name: :get,
            content_top: :get,
            content_recent: :get,
            graph_add: :post,
            graph_analyze: :get,
            graph_clear_attribute: :post,
            graph_community: :get,
            graph_create: :post,
            graph_download: :get,
            graph_drop: :post,
            graph_import: :get,
            graph_info: :get,
            graph_metric: :post,
            graph_list: :post,
            graph_list_attribute: :get,
            graph_set_attribute: :post,
            identity_lookup: :get,
            influencer_discover: :get,
            influencer_lookup: :get,
            misc_screen_name_lookup: :post,
            info_topology: :get,
            topic_search: :get
          }
      }[@version]
    end

    def response_types_by_endpoint
      {
        v1:
          {
            compare_twitter_screen_name: CompareResult,
            content_top: [Tweet],
            content_recent: [Tweet],
            graph_add: Graph,
            graph_analyze: Graph,
            graph_clear_attribute: GraphAttribute,
            graph_community: [Community],
            graph_create: Graph,
            graph_download: Download,
            graph_drop: Graph,
            graph_import: Graph,
            graph_info: Graph,
            graph_metric: [UserMetric],
            graph_list: [Graph],
            graph_list_attribute: [GraphAttribute],
            graph_set_attribute: GraphAttribute,
            identity_lookup: User,
            influencer_discover: [User],
            influencer_lookup: [Topic],
            misc_screen_name_lookup: [ScreenNameResolution],
            info_topology: APIStructure,
            topic_search: [DiscoverURL]
          }
      }[@version]
    end

    def extension
      ".json"
    end

    def method_missing(method, *args)
      if endpoints.include?(method)
        interpret(
          request(
            method, args[0]||{}
          ), response_types_by_endpoint[method]
        )
      else
        super
      end
    end

    def url_for(endpoint)
      base_url+endpoints[endpoint]+extension
    end

    def parse(response)
      JSON.parse(response)
    end

    def request(endpoint, args)
      puts args.inspect
      begin
        parse(
          RestClient::Request.execute(
            method: endpoint_http_methods[endpoint],
            url: url_for(endpoint),
            payload: args.merge(api_key: @api_key),
            timeout: 60000
          )
        )
      rescue => e
        parse(e.response)
      end
    end
  end
end