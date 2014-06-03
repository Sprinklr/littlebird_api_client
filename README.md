api-client
==========
API Client for use with LB API

Contact
---------------------

Questions, comments, or concerns? Feel free to reach out at api@getlittlebird.com!


Usage
---------------------


```ruby
  >> client = LittleBird::Client.new(api_key)
  # To specify version and host, add those options after api key (eg LittleBird::Client.new(api_key, 1, "localhost"))
  >> client.content_top(term: "SNA")
  => [#<Tweet:0x007f809d1a31a8 @id=471361237381439488, @id_str="471361237381439488", @favorite_count=12, @retweet_count=27, @screen_name="TechCrunch", @user_id=816653, @user_id_str="816653", @urls=["http://bit.ly/SLQYr9"], @created_at=2014-05-27 11:44:11 -0700, @client=#<LittleBird::Client:0x007f809e16ccb0 @api_key="533c98700765e035b129bcf2", @version=:v1, @base_url="api.getlittlebird.com">>]
```
## Endpoints

### compare_twitter_screen_name
Compare a user to a given search term - show the set of relationships the user has in relation to people related to a term

Parameter possibilities:
  [:screen_name, :term]

```ruby
  >> client.compare_twitter_screen_name(term: "SNA", screen_name: "zephoria")
```

### content_top
Return metadata around high-performing twitter statuses from insiders given a topic

Parameter possibilities:
  [:term]

```ruby
  >> client.content_top(term: "SNA")
```

### content_recent
Return metadata around the most recent twitter statuses from insiders given a topic

Parameter possibilities:
  [:term]

```ruby
  >> client.content_recent(term: "SNA")
```

### graph_add
Add users to an existing graph created by the API account

Parameter possibilities:
  [:domain, :id, :identity],
  [:domain, :id, :identities]

```ruby
  >> client.graph_add(identities: [19512246, 18911399, 2192301, 16453892, 1002913782], domain: "twitter", id: "533c98700765e035b129bcf2")
```

### graph_analyze
Trigger an analysis of an existing non-empty graph created by the API account.

Parameter possibilities:
  [:id]

```ruby
  >> client.graph_analyze(id: "533c98700765e035b129bcf2")
```

### graph_clear_attribute
Clear previously set attributes for a set of nodes contained in an existing non empty graph.

Parameter possibilities:
  [:domain, :id, :identities, :name], 
  [:domain, :id, :identity, :name], 
  [:id, :name, :node_ids], 
  [:id, :name, :node_id]

```ruby
  >> client.graph_clear_attribute(identities: [19512246, 18911399, 2192301, 16453892, 1002913782], domain: "twitter", id: "533c98700765e035b129bcf2", name: "test")
```

### graph_community
Returns an overview of the distinct communities detected in a given graph via their modularity class. Set the 'users' variable to ```true``` to show the actual users per community rather than an overview of the groups.

Parameter possibilities:
  [:analysis_id],
  [:analysis_id, :users]

```ruby
  >> client.graph_community(analysis_id: "533c98700765e035b129bcf2")
```

### graph_create
Create a new graph.

Parameter possibilities:
  [:term]

```ruby
  >> client.graph_create(term: "SNA")
```

### graph_download
Returns an export of the graph as specified by the format variable - can currently be set to "gexf", "csv", or "sigmajs".

Parameter possibilities:
  [:format, :analysis_id]

```ruby
  >> client.graph_download(analysis_id: "533c98700765e035b129bcf2", format: "gexf")
```

### graph_drop
Delete either an analysis or a graph entirely from the account.

Parameter possibilities:
  [:id],
  [:analysis_id]

```ruby
  >> client.graph_drop(analysis_id: "533c98700765e035b129bcf2")
```

### graph_info
Display information about a given graph

Parameter possibilities:
  [:id]

```ruby
  >> client.graph_info(id: "533c98700765e035b129bcf2")
```

### graph_metric
Display a set of values per node in a given graph and a metric of interest. Current metrics provided are "closeness", "betweenness", "coreness"", "modularity", and "degree"

Parameter possibilities:
  [:analysis_id, :metric],
  [:analysis_id, :metric, :users]

```ruby
  >> client.graph_metric(analysis_id: "533c98700765e035b129bcf2", metric: "betweenness")
```

### graph_list
List all graphs that this API account has created.

Parameter possibilities:
  None

```ruby
  >> client.graph_list
```

### graph_set_attribute
Set a series of attributes for a set of nodes (and their values in a separate array, mapped to the position of the node IDs) on a given graph with a given name for the attribute. Nodes must already exist on the graph, otherwise the setting of the attribute will fail.

Parameter possibilities:
  [:domain, :id, :identities, :name, :values], 
  [:domain, :id, :identity, :name, :value], 
  [:id, :name, :node_ids, :values], 
  [:id, :name, :node_id, :value]

```ruby
  >> client.graph_set_attribute(identities: [19512246, 18911399, 2192301, 16453892, 1002913782], domain: "twitter", id: "533c98700765e035b129bcf2", name: "test", values: [1,2,3,4,5])
```

### graph_set_recursive_attribute
Set a series of attributes for a set of nodes (and their values in a separate array, mapped to the position of the node IDs) on a given graph with a given name for the attribute. Nodes must already exist on the graph, otherwise the setting of the attribute will fail. Unlike normal attributes, recursive attributes will generate a score for all other users where a score was not assigned which is an indicator to the distance to nodes that have the variable set.

Parameter possibilities:
  [:domain, :id, :identities, :name, :values], 
  [:domain, :id, :identity, :name, :value], 
  [:id, :name, :node_ids, :values], 
  [:id, :name, :node_id, :value]

```ruby
  >> client.graph_set_recursive_attribute(identities: [19512246, 18911399, 2192301, 16453892, 1002913782], domain: "twitter", id: "533c98700765e035b129bcf2", name: "test", values: [1,1,1,1,1])
```

### identity_lookup
Return an influencer and their primary account data given either a domain/identity pair or a direct node_id

Parameter possibilities:
  [:node_id_],
  [:domain, :identity]

```ruby
  >> client.identity_lookup(identity: 19512246, domain: "twitter")
```

### influencer_discover
Return a set of influencers given a topic, along with some data about those users. Set Domain to "facebook", "twitter", "youtube", etc to only return users with accounts on those services.

Parameter possibilities:
  [:term],
  [:domain, :term]

```ruby
  >> client.influencer_discover(identities: [19512246, 18911399, 2192301, 16453892, 1002913782], domain: "twitter", id: "533c98700765e035b129bcf2", name: "test", values: [1,1,1,1,1])
```

### influencer_lookup
Return a set of interests shared by influencers, along with a score. Set Domain to "facebook", "twitter", "youtube", etc to only return users with accounts on those services.

Parameter possibilities:
  [:domain, :identities],
  [:domain, :identity]

```ruby
  >> client.influencer_lookup(identities: [19512246, 18911399, 2192301, 16453892, 1002913782], domain: "twitter", id: "533c98700765e035b129bcf2", name: "test", values: [1,1,1,1,1])
```

### misc_screen_name_lookup
Lookup ids from twitter given the screen names of a set of users.

Parameter possibilities:
  [:domain, :screen_names],
  [:domain, :screen_name]

```ruby
  >> client.misc_screen_name_lookup(screen_names: ["dgaff"], domain: "twitter")
```

### info_topology
Return information about available endpoints on the API - set include_rate_limit_status to true to see current rate limits per endpoint.

Parameter possibilities:
  [:include_rate_limit_status]

```ruby
  >> client.info_topology
```

### topic_search
Return links to API endpoints for existing reports given a term to search on.

Parameter possibilities:
  [:term]

```ruby
  >> client.topic_search(term: "SNA")
```

