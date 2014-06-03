module LittleBird
  class Graph < ResponseType
    def add(ids, opts={})
      client.graph_add({identities: [ids].flatten, id: id}.merge(opts))
    end
  
    def download_gexf_to(analysis_id, file=StringIO.new)
      client.graph_download(analysis_id: analysis_id, format: "gexf").to_file(file)
    end

    def download_csv_to(analysis_id, file=StringIO.new)
      client.graph_download(analysis_id: analysis_id, format: "csv").to_file(file)
    end

    def analyze
      client.graph_analyze(id: id)
    end
  
    def clear_attributes(opts)
      names = opts.delete(:names) || opts.delete("names")
      names.each do |name|
        client.graph_clear_attribute(opts.merge(id: id, name: name))
      end
    end

    def clear_attribute(opts)
      client.graph_analyze(opts.merge(id: id))
    end

    def communities(analysis_id)
      client.graph_community(analysis_id: analysis_id)
    end

    def community(analysis_id, community_id)
      client.graph_community(analysis_id: analysis_id, community_id: community_id)
    end

    def communities_users(analysis_id)
      client.graph_community(analysis_id: analysis_id, users: true)
    end

    def community_users(analysis_id, community_id)
      client.graph_community(analysis_id: analysis_id, community_id: community_id, users: true)
    end

    def drop
      client.graph_drop(id: id)
    end

    def info
      client.graph_info(id: id)
    end

    def set_attribute
      client.graph_set_attribute(opts.merge(id: id))
    end
  
    #usage params = {api_key: "533c98700765e035b1000001", term: "SNA", nodes: [19512246, 18911399, 2192301], attributes: {"name" => {"19512246" => 1, "18911399" => 2}}`, domain: "twitter"}
    def self.run(opts={})
      opts[:api_version] ||= 1
      opts[:host] ||= "0.0.0.0:8083"
      client = LittleBird::Client.new(opts[:api_key], opts[:api_version], opts[:host])
      sub_graph = client.graph_create(term: opts[:term])
      sub_graph.add(opts[:nodes], domain: opts[:domain])
      sub_graph.analyze
    end
  end
end