  


<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# githubog: http://ogp.me/ns/fb/githubog#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>contributingcode/app/controllers/add_requests_controller.rb at validate · cloudfoundry-samples/contributingcode</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />

    
    

    <meta content="authenticity_token" name="csrf-param" />
<meta content="JqkIvHoVrEkrjWXnWFxEv2sJhcBYf/ri6MKDPl81Clk=" name="csrf-token" />

    <link href="https://a248.e.akamai.net/assets.github.com/stylesheets/bundles/github-83f6d9de9d84b203707ab4ba8bdf0bd6478f0d5b.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="https://a248.e.akamai.net/assets.github.com/stylesheets/bundles/github2-84fb3a68186ca69e4930d889b6a55de7fb79856a.css" media="screen" rel="stylesheet" type="text/css" />
    
    


    <script src="https://a248.e.akamai.net/assets.github.com/javascripts/bundles/frameworks-a450c7f907bdc1ee6b362ab1ecca811c761fd259.js" type="text/javascript"></script>
    
    <script defer="defer" src="https://a248.e.akamai.net/assets.github.com/javascripts/bundles/github-8c27679ce3c4109571a8ad967a3cb83df487a71b.js" type="text/javascript"></script>
    
    

      <link rel='permalink' href='/cloudfoundry-samples/contributingcode/blob/77bb0dd49bc5f1c45433583d788a12ac26f194f8/app/controllers/add_requests_controller.rb'>
    <meta property="og:title" content="contributingcode"/>
    <meta property="og:type" content="githubog:gitrepository"/>
    <meta property="og:url" content="https://github.com/cloudfoundry-samples/contributingcode"/>
    <meta property="og:image" content="https://a248.e.akamai.net/assets.github.com/images/gravatars/gravatar-140.png?1329921026"/>
    <meta property="og:site_name" content="GitHub"/>
    <meta property="og:description" content="contributingcode - The official website for the contributing code sprint organized by cloudfoundry for social good "/>

    <meta name="description" content="contributingcode - The official website for the contributing code sprint organized by cloudfoundry for social good " />

  <link href="https://github.com/cloudfoundry-samples/contributingcode/commits/validate.atom?login=jacksoncvm&token=5c25c9bd579475202e7a291b2d781982" rel="alternate" title="Recent Commits to contributingcode:validate" type="application/atom+xml" />

  </head>


  <body class="logged_in page-blob  vis-private env-production " data-blob-contribs-enabled="yes">
    <div id="wrapper">

    
    
    

      <div id="header" class="true clearfix">
        <div class="container clearfix">
          <a class="site-logo" href="https://github.com/">
            <!--[if IE]>
            <img alt="GitHub" class="github-logo" src="https://a248.e.akamai.net/assets.github.com/images/modules/header/logov7.png?1329921026" />
            <img alt="GitHub" class="github-logo-hover" src="https://a248.e.akamai.net/assets.github.com/images/modules/header/logov7-hover.png?1329921026" />
            <![endif]-->
            <img alt="GitHub" class="github-logo-4x" height="30" src="https://a248.e.akamai.net/assets.github.com/images/modules/header/logov7@4x.png?1337118071" />
            <img alt="GitHub" class="github-logo-4x-hover" height="30" src="https://a248.e.akamai.net/assets.github.com/images/modules/header/logov7@4x-hover.png?1337118071" />
          </a>

              
    <div class="topsearch  ">
        <form accept-charset="UTF-8" action="/search" id="top_search_form" method="get">
  <a href="/search" class="advanced-search tooltipped downwards" title="Advanced Search"><span class="mini-icon mini-icon-advanced-search"></span></a>
  <div class="search placeholder-field js-placeholder-field">
    <input type="text" class="search my_repos_autocompleter" id="global-search-field" name="q" results="5" spellcheck="false" autocomplete="off" data-autocomplete="my-repos-autocomplete" placeholder="Search&hellip;" data-hotkey="s" />
    <div id="my-repos-autocomplete" class="autocomplete-results">
      <ul class="js-navigation-container"></ul>
    </div>
    <input type="submit" value="Search" class="button">
    <span class="mini-icon mini-icon-search-input"></span>
  </div>
  <input type="hidden" name="type" value="Everything" />
  <input type="hidden" name="repo" value="" />
  <input type="hidden" name="langOverride" value="" />
  <input type="hidden" name="start_value" value="1" />
</form>

      <ul class="top-nav">
          <li class="explore"><a href="https://github.com/explore">Explore</a></li>
          <li><a href="https://gist.github.com">Gist</a></li>
          <li><a href="/blog">Blog</a></li>
        <li><a href="http://help.github.com">Help</a></li>
      </ul>
    </div>


            


  <div id="userbox">
    <div id="user">
      <a href="https://github.com/jacksoncvm"><img height="20" src="https://secure.gravatar.com/avatar/f44ac166c0a101c9fdbffe2a2bf5578e?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png" width="20" /></a>
      <a href="https://github.com/jacksoncvm" class="name">jacksoncvm</a>
    </div>
    <ul id="user-links">
      <li>
        <a href="/new" id="new_repo" class="tooltipped downwards" title="Create a New Repo"><span class="mini-icon mini-icon-create"></span></a>
      </li>
      <li>
        <a href="/inbox/notifications" id="notifications" class="tooltipped downwards" title="Notifications">
          <span class="mini-icon mini-icon-notifications"></span>
          <span class="unread_count">50</span>
        </a>
      </li>
      <li>
        <a href="/settings/profile" id="settings" class="tooltipped downwards" title="Account Settings">
          <span class="mini-icon mini-icon-account-settings"></span>
        </a>
      </li>
      <li>
          <a href="/logout" data-method="post" id="logout" class="tooltipped downwards" title="Log Out">
            <span class="mini-icon mini-icon-logout"></span>
          </a>
      </li>
    </ul>
  </div>



          
        </div>
      </div>

      

            <div class="site hfeed" itemscope itemtype="http://schema.org/WebPage">
      <div class="container hentry">
        <div class="pagehead repohead instapaper_ignore readability-menu">
        <div class="title-actions-bar">
          



              <ul class="pagehead-actions">

          <li class="for-owner"><a href="/cloudfoundry-samples/contributingcode/admin" class="minibutton btn-admin "><span class="icon"></span>Admin</a></li>

              <li class="nspr">
                <a href="/cloudfoundry-samples/contributingcode/pull/new/validate" class="minibutton btn-pull-request "><span class="icon"></span>Pull Request</a>
              </li>

          <li class="js-toggler-container js-social-container watch-button-container ">
            <span class="watch-button"><a href="/cloudfoundry-samples/contributingcode/toggle_watch" class="minibutton btn-watch js-toggler-target lighter" data-remote="true" data-method="post" rel="nofollow"><span class="icon"></span> Watch</a><a class="social-count js-social-count" href="/cloudfoundry-samples/contributingcode/watchers">2</a></span>
            <span class="unwatch-button"><a href="/cloudfoundry-samples/contributingcode/toggle_watch" class="minibutton btn-unwatch js-toggler-target lighter" data-remote="true" data-method="post" rel="nofollow"><span class="icon"></span> Unwatch</a><a class="social-count js-social-count" href="/cloudfoundry-samples/contributingcode/watchers">2</a></span>
          </li>

              <li>
                <a href="/cloudfoundry-samples/contributingcode/fork_select" class="minibutton btn-fork js-toggler-target lighter" rel="facebox nofollow"><span class="icon"></span> Fork</a><a href="/cloudfoundry-samples/contributingcode/network" class="social-count">1</a>
              </li>


    </ul>

          <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title private">
            <span class="repo-label"><span>private</span></span>
            <span class="mega-icon mega-icon-private-repo"></span>
            <span class="author vcard">
<a href="/cloudfoundry-samples" class="url fn" itemprop="url" rel="author">              <span itemprop="title">cloudfoundry-samples</span>
              </a></span> /
            <strong><a href="/cloudfoundry-samples/contributingcode" class="js-current-repository">contributingcode</a></strong>
          </h1>
        </div>

          

  <ul class="tabs">
    <li><a href="/cloudfoundry-samples/contributingcode/tree/validate" class="selected" highlight="repo_sourcerepo_downloadsrepo_commitsrepo_tagsrepo_branches">Code</a></li>
    <li><a href="/cloudfoundry-samples/contributingcode/network" highlight="repo_network">Network</a>
    <li><a href="/cloudfoundry-samples/contributingcode/pulls" highlight="repo_pulls">Pull Requests <span class='counter'>0</span></a></li>

      <li><a href="/cloudfoundry-samples/contributingcode/issues" highlight="repo_issues">Issues <span class='counter'>4</span></a></li>

      <li><a href="/cloudfoundry-samples/contributingcode/wiki" highlight="repo_wiki">Wiki</a></li>

    <li><a href="/cloudfoundry-samples/contributingcode/graphs" highlight="repo_graphsrepo_contributors">Graphs</a></li>

  </ul>
 
<div class="frame frame-center tree-finder" style="display:none"
      data-tree-list-url="/cloudfoundry-samples/contributingcode/tree-list/77bb0dd49bc5f1c45433583d788a12ac26f194f8"
      data-blob-url-prefix="/cloudfoundry-samples/contributingcode/blob/77bb0dd49bc5f1c45433583d788a12ac26f194f8"
    >

  <div class="breadcrumb">
    <span class="bold"><a href="/cloudfoundry-samples/contributingcode">contributingcode</a></span> /
    <input class="tree-finder-input js-navigation-enable" type="text" name="query" autocomplete="off" spellcheck="false">
  </div>

    <div class="octotip">
      <p>
        <a href="/cloudfoundry-samples/contributingcode/dismiss-tree-finder-help" class="dismiss js-dismiss-tree-list-help" title="Hide this notice forever" rel="nofollow">Dismiss</a>
        <span class="bold">Octotip:</span> You've activated the <em>file finder</em>
        by pressing <span class="kbd">t</span> Start typing to filter the
        file list. Use <span class="kbd badmono">↑</span> and
        <span class="kbd badmono">↓</span> to navigate,
        <span class="kbd">enter</span> to view files.
      </p>
    </div>

  <table class="tree-browser" cellpadding="0" cellspacing="0">
    <tr class="js-header"><th>&nbsp;</th><th>name</th></tr>
    <tr class="js-no-results no-results" style="display: none">
      <th colspan="2">No matching files</th>
    </tr>
    <tbody class="js-results-list js-navigation-container">
    </tbody>
  </table>
</div>

<div id="jump-to-line" style="display:none">
  <h2>Jump to Line</h2>
  <form accept-charset="UTF-8">
    <input class="textfield" type="text">
    <div class="full-button">
      <button type="submit" class="classy">
        <span>Go</span>
      </button>
    </div>
  </form>
</div>


<div class="subnav-bar">

  <ul class="actions subnav">
    <li><a href="/cloudfoundry-samples/contributingcode/tags" class="blank" highlight="repo_tags">Tags <span class="counter">0</span></a></li>
    <li><a href="/cloudfoundry-samples/contributingcode/downloads" class="blank downloads-blank" highlight="repo_downloads">Downloads <span class="counter">0</span></a></li>
    
  <li class="search repo-search ">
<form accept-charset="UTF-8" action="/cloudfoundry-samples/contributingcode/search" method="get">      <span class="fieldwrap">
        <input type="text" name="q" value=""
          placeholder="Search source code&hellip;" /><button type="submit" class="minibutton"><span class="mini-icon mini-icon-search-input"></span></button>
      </span>
      <input type="hidden" id="lang-value" name="langOverride" value="" />
      <input type="hidden" id="start-value" name="start" value="" />
</form>  </li>

  </ul>

  <ul class="scope">
    <li class="switcher">

      <div class="context-menu-container js-menu-container js-context-menu">
        <a href="#"
           class="minibutton bigger switcher js-menu-target js-commitish-button btn-branch repo-tree"
           data-hotkey="w"
           data-master-branch="master"
           data-ref="validate">
           <span><span class="icon"></span><i>branch:</i> validate</span>
        </a>

        <div class="context-pane commitish-context js-menu-content">
          <a href="javascript:;" class="close js-menu-close"><span class="mini-icon mini-icon-remove-close"></span></a>
          <div class="context-title">Switch Branches/Tags</div>
          <div class="context-body pane-selector commitish-selector js-navigation-container">
            <div class="filterbar">
              <input type="text" id="context-commitish-filter-field" class="js-navigation-enable" placeholder="Filter branches/tags" data-filterable />

              <ul class="tabs">
                <li><a href="#" data-filter="branches" class="selected">Branches</a></li>
                <li><a href="#" data-filter="tags">Tags</a></li>
              </ul>
            </div>

            <div class="js-filter-tab js-filter-branches" data-filterable-for="context-commitish-filter-field">
              <div class="no-results js-not-filterable">Nothing to show</div>
                <div class="commitish-item branch-commitish selector-item js-navigation-item js-navigation-target">
                  <h4>
                      <a href="/cloudfoundry-samples/contributingcode/blob/master/app/controllers/add_requests_controller.rb" class="js-navigation-open" data-name="master" rel="nofollow">master</a>
                  </h4>
                </div>
                <div class="commitish-item branch-commitish selector-item js-navigation-item js-navigation-target">
                  <h4>
                      <a href="/cloudfoundry-samples/contributingcode/blob/monica/app/controllers/add_requests_controller.rb" class="js-navigation-open" data-name="monica" rel="nofollow">monica</a>
                  </h4>
                </div>
                <div class="commitish-item branch-commitish selector-item js-navigation-item js-navigation-target">
                  <h4>
                      <a href="/cloudfoundry-samples/contributingcode/blob/validate/app/controllers/add_requests_controller.rb" class="js-navigation-open" data-name="validate" rel="nofollow">validate</a>
                  </h4>
                </div>
            </div>

            <div class="js-filter-tab js-filter-tags" style="display:none" data-filterable-for="context-commitish-filter-field">
              <div class="no-results js-not-filterable">Nothing to show</div>
            </div>
          </div>
        </div><!-- /.commitish-context-context -->
      </div>

    </li>
  </ul>

  <ul class="subnav with-scope">

    <li><a href="/cloudfoundry-samples/contributingcode/tree/validate" class="selected" highlight="repo_source">Files</a></li>
    <li><a href="/cloudfoundry-samples/contributingcode/commits/validate" highlight="repo_commits">Commits</a></li>
    <li><a href="/cloudfoundry-samples/contributingcode/branches" class="" highlight="repo_branches" rel="nofollow">Branches <span class="counter">3</span></a></li>
  </ul>

</div>

  
  
  


          

        </div><!-- /.repohead -->

        





<!-- block_view_fragment_key: views10/v8/blob:v21:ef4d3aae6cf996ceece54baa5ed6ec07 -->
  <div id="slider">

    <div class="breadcrumb" data-path="app/controllers/add_requests_controller.rb/">
      <b itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/cloudfoundry-samples/contributingcode/tree/77bb0dd49bc5f1c45433583d788a12ac26f194f8" class="js-rewrite-sha" itemprop="url"><span itemprop="title">contributingcode</span></a></b> / <span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/cloudfoundry-samples/contributingcode/tree/77bb0dd49bc5f1c45433583d788a12ac26f194f8/app" class="js-rewrite-sha" itemscope="url"><span itemprop="title">app</span></a></span> / <span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/cloudfoundry-samples/contributingcode/tree/77bb0dd49bc5f1c45433583d788a12ac26f194f8/app/controllers" class="js-rewrite-sha" itemscope="url"><span itemprop="title">controllers</span></a></span> / <strong class="final-path">add_requests_controller.rb</strong> <span class="js-clippy mini-icon mini-icon-clippy " data-clipboard-text="app/controllers/add_requests_controller.rb" data-copied-hint="copied!" data-copy-hint="copy to clipboard"></span>
    </div>


      <div class="commit file-history-tease" data-path="app/controllers/add_requests_controller.rb/">
        <img class="main-avatar" height="24" src="https://secure.gravatar.com/avatar/0d301edeea452566420d0df6fc34f0e6?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png" width="24" />
        <span class="author"><a href="/mahil">mahil</a></span>
        <time class="js-relative-date" datetime="2012-06-11T16:48:17-07:00" title="2012-06-11 16:48:17">June 11, 2012</time>
        <div class="commit-title">
            <a href="/cloudfoundry-samples/contributingcode/commit/ac24992d528ba502e3b8ebaba0b1e87bb51ed709" class="message"> update team and add requests done</a>
        </div>

        <div class="participation">
          <p class="quickstat"><a href="#blob_contributors_box" rel="facebox"><strong>1</strong> contributor</a></p>
          
        </div>
        <div id="blob_contributors_box" style="display:none">
          <h2>Users on GitHub who have contributed to this file</h2>
          <ul class="facebox-user-list">
            <li>
              <img height="24" src="https://secure.gravatar.com/avatar/0d301edeea452566420d0df6fc34f0e6?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png" width="24" />
              <a href="/mahil">mahil</a>
            </li>
          </ul>
        </div>
      </div>

    <div class="frames">
      <div class="frame frame-center" data-path="app/controllers/add_requests_controller.rb/" data-permalink-url="/cloudfoundry-samples/contributingcode/blob/77bb0dd49bc5f1c45433583d788a12ac26f194f8/app/controllers/add_requests_controller.rb" data-title="contributingcode/app/controllers/add_requests_controller.rb at validate · cloudfoundry-samples/contributingcode · GitHub" data-type="blob">

        <div id="files" class="bubble">
          <div class="file">
            <div class="meta">
              <div class="info">
                <span class="icon"><b class="mini-icon mini-icon-text-file"></b></span>
                <span class="mode" title="File Mode">100644</span>
                  <span>73 lines (69 sloc)</span>
                <span>2.933 kb</span>
              </div>
              <ul class="button-group actions">
                  <li>
                    <a class="grouped-button file-edit-link minibutton bigger lighter js-rewrite-sha" href="/cloudfoundry-samples/contributingcode/edit/77bb0dd49bc5f1c45433583d788a12ac26f194f8/app/controllers/add_requests_controller.rb" data-method="post" rel="nofollow" data-hotkey="e">Edit this file</a>
                  </li>

                <li>
                  <a href="/cloudfoundry-samples/contributingcode/raw/validate/app/controllers/add_requests_controller.rb" class="minibutton btn-raw grouped-button bigger lighter" id="raw-url"><span class="icon"></span>Raw</a>
                </li>
                  <li>
                    <a href="/cloudfoundry-samples/contributingcode/blame/validate/app/controllers/add_requests_controller.rb" class="minibutton btn-blame grouped-button bigger lighter"><span class="icon"></span>Blame</a>
                  </li>
                <li>
                  <a href="/cloudfoundry-samples/contributingcode/commits/validate/app/controllers/add_requests_controller.rb" class="minibutton btn-history grouped-button bigger lighter" rel="nofollow"><span class="icon"></span>History</a>
                </li>
              </ul>
            </div>
              <div class="data type-ruby">
      <table cellpadding="0" cellspacing="0" class="lines">
        <tr>
          <td>
            <pre class="line_numbers"><span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
<span id="L36" rel="#L36">36</span>
<span id="L37" rel="#L37">37</span>
<span id="L38" rel="#L38">38</span>
<span id="L39" rel="#L39">39</span>
<span id="L40" rel="#L40">40</span>
<span id="L41" rel="#L41">41</span>
<span id="L42" rel="#L42">42</span>
<span id="L43" rel="#L43">43</span>
<span id="L44" rel="#L44">44</span>
<span id="L45" rel="#L45">45</span>
<span id="L46" rel="#L46">46</span>
<span id="L47" rel="#L47">47</span>
<span id="L48" rel="#L48">48</span>
<span id="L49" rel="#L49">49</span>
<span id="L50" rel="#L50">50</span>
<span id="L51" rel="#L51">51</span>
<span id="L52" rel="#L52">52</span>
<span id="L53" rel="#L53">53</span>
<span id="L54" rel="#L54">54</span>
<span id="L55" rel="#L55">55</span>
<span id="L56" rel="#L56">56</span>
<span id="L57" rel="#L57">57</span>
<span id="L58" rel="#L58">58</span>
<span id="L59" rel="#L59">59</span>
<span id="L60" rel="#L60">60</span>
<span id="L61" rel="#L61">61</span>
<span id="L62" rel="#L62">62</span>
<span id="L63" rel="#L63">63</span>
<span id="L64" rel="#L64">64</span>
<span id="L65" rel="#L65">65</span>
<span id="L66" rel="#L66">66</span>
<span id="L67" rel="#L67">67</span>
<span id="L68" rel="#L68">68</span>
<span id="L69" rel="#L69">69</span>
<span id="L70" rel="#L70">70</span>
<span id="L71" rel="#L71">71</span>
<span id="L72" rel="#L72">72</span>
<span id="L73" rel="#L73">73</span>
</pre>
          </td>
          <td width="100%">
                <div class="highlight"><pre><div class='line' id='LC1'><span class="k">class</span> <span class="nc">AddRequestsController</span> <span class="o">&lt;</span> <span class="no">ApplicationController</span></div><div class='line' id='LC2'>&nbsp;&nbsp;</div><div class='line' id='LC3'>&nbsp;&nbsp;<span class="c1"># Add request  </span></div><div class='line' id='LC4'>&nbsp;&nbsp;<span class="c1"># Send email to member and wait for conf </span></div><div class='line' id='LC5'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">create</span></div><div class='line' id='LC6'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">team</span> <span class="o">=</span> <span class="n">current_user</span><span class="o">.</span><span class="n">owned_team</span></div><div class='line' id='LC7'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">render</span> <span class="ss">:json</span> <span class="o">=&gt;</span> <span class="p">{</span><span class="ss">:err</span> <span class="o">=&gt;</span> <span class="s2">&quot;present&quot;</span><span class="p">,</span> <span class="ss">:data</span> <span class="o">=&gt;</span> <span class="kp">nil</span><span class="p">}</span> <span class="k">if</span> <span class="n">team</span><span class="o">.</span><span class="n">blank?</span> <span class="o">&amp;&amp;</span> <span class="n">team</span><span class="o">.</span><span class="n">member_count</span> <span class="o">&lt;</span> <span class="mi">4</span></div><div class='line' id='LC8'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Check if such user exists </span></div><div class='line' id='LC9'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">user</span> <span class="o">=</span> <span class="no">User</span><span class="o">.</span><span class="n">find_by_id</span><span class="p">(</span><span class="n">params</span><span class="o">[</span><span class="ss">:id</span><span class="o">]</span><span class="p">)</span></div><div class='line' id='LC10'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">render</span> <span class="ss">:json</span> <span class="o">=&gt;</span> <span class="p">{</span><span class="ss">:err</span> <span class="o">=&gt;</span> <span class="s2">&quot;present&quot;</span><span class="p">,</span> <span class="ss">:data</span> <span class="o">=&gt;</span> <span class="kp">nil</span><span class="p">}</span> <span class="k">if</span> <span class="n">user</span><span class="o">.</span><span class="n">blank?</span></div><div class='line' id='LC11'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># existing team member ?</span></div><div class='line' id='LC12'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">render</span> <span class="ss">:json</span> <span class="o">=&gt;</span> <span class="p">{</span><span class="ss">:err</span> <span class="o">=&gt;</span> <span class="s2">&quot;present&quot;</span><span class="p">,</span> <span class="ss">:data</span> <span class="o">=&gt;</span> <span class="kp">nil</span><span class="p">}</span> <span class="k">if</span> <span class="n">user</span><span class="o">.</span><span class="n">team</span><span class="o">.</span><span class="n">present?</span></div><div class='line' id='LC13'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># create a new add request</span></div><div class='line' id='LC14'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">request</span> <span class="o">=</span> <span class="no">AddRequest</span><span class="o">.</span><span class="n">new</span><span class="p">(</span><span class="ss">:user_id</span> <span class="o">=&gt;</span><span class="n">params</span><span class="o">[</span><span class="ss">:id</span><span class="o">]</span><span class="p">,</span> <span class="ss">:team_id</span><span class="o">=&gt;</span> <span class="n">team</span><span class="o">.</span><span class="n">id</span><span class="p">,</span> <span class="ss">:team_name</span> <span class="o">=&gt;</span> <span class="n">team</span><span class="o">.</span><span class="n">name</span><span class="p">)</span>  </div><div class='line' id='LC15'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="n">request</span><span class="o">.</span><span class="n">save</span></div><div class='line' id='LC16'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="no">Resque</span><span class="o">.</span><span class="n">enqueue</span><span class="p">(</span><span class="no">RequestMailer</span><span class="p">,</span><span class="n">current_user</span><span class="o">.</span><span class="n">name</span><span class="p">,</span><span class="n">team</span><span class="o">.</span><span class="n">name</span><span class="p">,</span><span class="n">user</span><span class="o">.</span><span class="n">email</span><span class="p">,</span><span class="mi">0</span><span class="p">)</span></div><div class='line' id='LC17'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">render</span> <span class="ss">:json</span> <span class="o">=&gt;</span> <span class="p">{</span><span class="ss">:err</span> <span class="o">=&gt;</span> <span class="kp">nil</span><span class="p">,</span> <span class="ss">:data</span> <span class="o">=&gt;</span> <span class="n">request</span><span class="p">}</span></div><div class='line' id='LC18'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span>  </div><div class='line' id='LC19'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">render</span> <span class="ss">:json</span> <span class="o">=&gt;</span> <span class="p">{</span><span class="ss">:err</span> <span class="o">=&gt;</span> <span class="s2">&quot;present&quot;</span><span class="p">,</span> <span class="ss">:data</span> <span class="o">=&gt;</span> <span class="n">request</span><span class="o">.</span><span class="n">errors</span><span class="o">.</span><span class="n">full_messages</span><span class="o">.</span><span class="n">to_s</span><span class="p">}</span></div><div class='line' id='LC20'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span> </div><div class='line' id='LC21'>&nbsp;&nbsp;<span class="k">end</span> </div><div class='line' id='LC22'><br/></div><div class='line' id='LC23'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">accept</span></div><div class='line' id='LC24'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># check if team exists</span></div><div class='line' id='LC25'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">render</span> <span class="ss">:json</span> <span class="o">=&gt;</span> <span class="p">{</span><span class="ss">:err</span> <span class="o">=&gt;</span><span class="s2">&quot;e1&quot;</span><span class="p">,</span> <span class="ss">:data</span> <span class="o">=&gt;</span> <span class="s2">&quot;Already in a team &quot;</span><span class="p">}</span> <span class="ow">and</span> <span class="k">return</span> <span class="k">if</span> <span class="n">current_user</span><span class="o">.</span><span class="n">team</span><span class="o">.</span><span class="n">present?</span></div><div class='line' id='LC26'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># fetch team </span></div><div class='line' id='LC27'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">team</span> <span class="o">=</span> <span class="no">Team</span><span class="o">.</span><span class="n">find_by_id</span><span class="p">(</span><span class="n">params</span><span class="o">[</span><span class="ss">:id</span><span class="o">]</span><span class="p">)</span></div><div class='line' id='LC28'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># check team </span></div><div class='line' id='LC29'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">render</span> <span class="ss">:json</span> <span class="o">=&gt;</span> <span class="p">{</span><span class="ss">:err</span> <span class="o">=&gt;</span><span class="s2">&quot;e1&quot;</span><span class="p">,</span> <span class="ss">:data</span> <span class="o">=&gt;</span> <span class="s2">&quot;No such team&quot;</span><span class="p">}</span> <span class="ow">and</span> <span class="k">return</span>  <span class="k">if</span> <span class="n">team</span><span class="o">.</span><span class="n">blank?</span></div><div class='line' id='LC30'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># check team </span></div><div class='line' id='LC31'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">render</span> <span class="ss">:json</span> <span class="o">=&gt;</span> <span class="p">{</span><span class="ss">:err</span> <span class="o">=&gt;</span><span class="s2">&quot;e1&quot;</span><span class="p">,</span> <span class="ss">:data</span> <span class="o">=&gt;</span> <span class="s2">&quot;Team already has 4 members !&quot;</span><span class="p">}</span> <span class="ow">and</span> <span class="k">return</span> <span class="k">if</span> <span class="n">team</span><span class="o">.</span><span class="n">member_count</span> <span class="o">&gt;=</span> <span class="mi">4</span></div><div class='line' id='LC32'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Query for member  </span></div><div class='line' id='LC33'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">add_request</span> <span class="o">=</span> <span class="n">team</span><span class="o">.</span><span class="n">add_requests</span><span class="o">.</span><span class="n">find_by_user_id</span><span class="p">(</span><span class="n">current_user</span><span class="o">.</span><span class="n">id</span><span class="p">)</span></div><div class='line' id='LC34'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Check if member request exists </span></div><div class='line' id='LC35'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">render</span> <span class="ss">:json</span> <span class="o">=&gt;</span> <span class="p">{</span><span class="ss">:err</span> <span class="o">=&gt;</span><span class="s2">&quot;e2&quot;</span><span class="p">,</span> <span class="ss">:data</span> <span class="o">=&gt;</span> <span class="s2">&quot;No such request&quot;</span><span class="p">}</span> <span class="ow">and</span> <span class="k">return</span>  <span class="k">if</span> <span class="n">add_request</span><span class="o">.</span><span class="n">blank?</span></div><div class='line' id='LC36'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># add to team member table </span></div><div class='line' id='LC37'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">team_member</span> <span class="o">=</span> <span class="no">TeamMember</span><span class="o">.</span><span class="n">new</span><span class="p">(</span><span class="ss">:user_id</span> <span class="o">=&gt;</span> <span class="n">current_user</span><span class="o">.</span><span class="n">id</span><span class="p">,</span> <span class="ss">:team_id</span> <span class="o">=&gt;</span> <span class="n">team</span><span class="o">.</span><span class="n">id</span><span class="p">,</span> <span class="ss">:user_handle</span><span class="o">=&gt;</span> <span class="n">current_user</span><span class="o">.</span><span class="n">handle</span><span class="p">)</span></div><div class='line' id='LC38'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># save team member </span></div><div class='line' id='LC39'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">team_member</span><span class="o">.</span><span class="n">save</span> </div><div class='line' id='LC40'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Increment team count and save</span></div><div class='line' id='LC41'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">team</span><span class="o">.</span><span class="n">update_attribute</span><span class="p">(</span><span class="s1">&#39;member_count&#39;</span><span class="p">,</span> <span class="n">team</span><span class="o">.</span><span class="n">member_count</span><span class="o">+</span><span class="mi">1</span><span class="p">)</span></div><div class='line' id='LC42'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Find member to send email </span></div><div class='line' id='LC43'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">owner</span> <span class="o">=</span> <span class="no">User</span><span class="o">.</span><span class="n">find_by_id</span><span class="p">(</span><span class="n">team</span><span class="o">.</span><span class="n">owner_id</span><span class="p">)</span></div><div class='line' id='LC44'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># delete all join requests </span></div><div class='line' id='LC45'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">current_user</span><span class="o">.</span><span class="n">join_requests</span><span class="o">.</span><span class="n">destroy_all</span></div><div class='line' id='LC46'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Delete add_req</span></div><div class='line' id='LC47'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">add_request</span><span class="o">.</span><span class="n">destroy</span></div><div class='line' id='LC48'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Email member </span></div><div class='line' id='LC49'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="no">Resque</span><span class="o">.</span><span class="n">enqueue</span><span class="p">(</span><span class="no">DecideTeamMailer</span><span class="p">,</span> <span class="n">current_user</span><span class="o">.</span><span class="n">name</span><span class="p">,</span> <span class="n">team</span><span class="o">.</span><span class="n">name</span><span class="p">,</span> <span class="n">owner</span><span class="o">.</span><span class="n">email</span><span class="p">,</span> <span class="mi">5</span><span class="p">)</span></div><div class='line' id='LC50'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># return team </span></div><div class='line' id='LC51'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">render</span> <span class="ss">:json</span> <span class="o">=&gt;</span> <span class="p">{</span><span class="ss">:err</span> <span class="o">=&gt;</span> <span class="kp">nil</span><span class="p">,</span> <span class="ss">:data</span> <span class="o">=&gt;</span> <span class="kp">nil</span><span class="p">}</span> <span class="ow">and</span> <span class="k">return</span> </div><div class='line' id='LC52'>&nbsp;&nbsp;<span class="k">end</span> </div><div class='line' id='LC53'><br/></div><div class='line' id='LC54'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">destroy</span></div><div class='line' id='LC55'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># fetch team </span></div><div class='line' id='LC56'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">team</span> <span class="o">=</span> <span class="no">Team</span><span class="o">.</span><span class="n">find_by_id</span><span class="p">(</span><span class="n">params</span><span class="o">[</span><span class="ss">:id</span><span class="o">]</span><span class="p">)</span></div><div class='line' id='LC57'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># check team </span></div><div class='line' id='LC58'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">render</span> <span class="ss">:json</span> <span class="o">=&gt;</span> <span class="p">{</span><span class="ss">:err</span> <span class="o">=&gt;</span><span class="s2">&quot;e1&quot;</span><span class="p">,</span> <span class="ss">:data</span> <span class="o">=&gt;</span> <span class="s2">&quot;No such team&quot;</span><span class="p">}</span> <span class="k">if</span> <span class="n">team</span><span class="o">.</span><span class="n">blank?</span></div><div class='line' id='LC59'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Query for member  </span></div><div class='line' id='LC60'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">add_request</span> <span class="o">=</span> <span class="n">team</span><span class="o">.</span><span class="n">add_requests</span><span class="o">.</span><span class="n">find_by_user_id</span><span class="p">(</span><span class="n">current_user</span><span class="o">.</span><span class="n">id</span><span class="p">)</span></div><div class='line' id='LC61'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Check if member request exists </span></div><div class='line' id='LC62'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">render</span> <span class="ss">:json</span> <span class="o">=&gt;</span> <span class="p">{</span><span class="ss">:err</span> <span class="o">=&gt;</span><span class="s2">&quot;e2&quot;</span><span class="p">,</span> <span class="ss">:data</span> <span class="o">=&gt;</span> <span class="s2">&quot;No such request&quot;</span><span class="p">}</span>  <span class="k">if</span> <span class="n">add_request</span><span class="o">.</span><span class="n">blank?</span></div><div class='line' id='LC63'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Find member to send email </span></div><div class='line' id='LC64'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">owner</span> <span class="o">=</span> <span class="no">User</span><span class="o">.</span><span class="n">find_by_id</span><span class="p">(</span><span class="n">team</span><span class="o">.</span><span class="n">owner_id</span><span class="p">)</span></div><div class='line' id='LC65'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Delete add_req</span></div><div class='line' id='LC66'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">add_request</span><span class="o">.</span><span class="n">destroy</span></div><div class='line' id='LC67'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Email member </span></div><div class='line' id='LC68'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="no">Resque</span><span class="o">.</span><span class="n">enqueue</span><span class="p">(</span><span class="no">DecideTeamMailer</span><span class="p">,</span> <span class="n">current_user</span><span class="o">.</span><span class="n">name</span><span class="p">,</span> <span class="n">team</span><span class="o">.</span><span class="n">name</span><span class="p">,</span> <span class="n">owner</span><span class="o">.</span><span class="n">email</span><span class="p">,</span> <span class="mi">6</span><span class="p">)</span></div><div class='line' id='LC69'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># return team </span></div><div class='line' id='LC70'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">render</span> <span class="ss">:json</span> <span class="o">=&gt;</span> <span class="p">{</span><span class="ss">:err</span> <span class="o">=&gt;</span> <span class="kp">nil</span><span class="p">,</span> <span class="ss">:data</span> <span class="o">=&gt;</span> <span class="kp">nil</span><span class="p">}</span> </div><div class='line' id='LC71'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC72'><br/></div><div class='line' id='LC73'><span class="k">end</span></div></pre></div>
          </td>
        </tr>
      </table>
  </div>

          </div>
        </div>
      </div>
    </div>

  </div>

<div class="frame frame-loading large-loading-area" style="display:none;" data-tree-list-url="/cloudfoundry-samples/contributingcode/tree-list/77bb0dd49bc5f1c45433583d788a12ac26f194f8" data-blob-url-prefix="/cloudfoundry-samples/contributingcode/blob/77bb0dd49bc5f1c45433583d788a12ac26f194f8">
  <img src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-64.gif?1329921026" height="64" width="64">
</div>

      </div>
      <div class="context-overlay"></div>
    </div>

      <div id="footer-push"></div><!-- hack for sticky footer -->
    </div><!-- end of wrapper - hack for sticky footer -->

      <!-- footer -->
      <div id="footer" >
        
  <div class="upper_footer">
     <div class="container clearfix">

       <!--[if IE]><h4 id="blacktocat_ie">GitHub Links</h4><![endif]-->
       <![if !IE]><h4 id="blacktocat">GitHub Links</h4><![endif]>

       <ul class="footer_nav">
         <h4>GitHub</h4>
         <li><a href="https://github.com/about">About</a></li>
         <li><a href="https://github.com/blog">Blog</a></li>
         <li><a href="https://github.com/features">Features</a></li>
         <li><a href="https://github.com/contact">Contact &amp; Support</a></li>
         <li><a href="https://github.com/training">Training</a></li>
         <li><a href="http://enterprise.github.com/">GitHub Enterprise</a></li>
         <li><a href="http://status.github.com/">Site Status</a></li>
       </ul>

       <ul class="footer_nav">
         <h4>Tools</h4>
         <li><a href="http://get.gaug.es/">Gauges: Analyze web traffic</a></li>
         <li><a href="http://speakerdeck.com">Speaker Deck: Presentations</a></li>
         <li><a href="https://gist.github.com">Gist: Code snippets</a></li>
         <li><a href="http://mac.github.com/">GitHub for Mac</a></li>
         <li><a href="http://windows.github.com/">GitHub for Windows</a></li>
         <li><a href="http://mobile.github.com/">Issues for iPhone</a></li>
         <li><a href="http://jobs.github.com/">Job Board</a></li>
       </ul>

       <ul class="footer_nav">
         <h4>Extras</h4>
         <li><a href="http://shop.github.com/">GitHub Shop</a></li>
         <li><a href="http://octodex.github.com/">The Octodex</a></li>
       </ul>

       <ul class="footer_nav">
         <h4>Documentation</h4>
         <li><a href="http://help.github.com/">GitHub Help</a></li>
         <li><a href="http://developer.github.com/">Developer API</a></li>
         <li><a href="http://github.github.com/github-flavored-markdown/">GitHub Flavored Markdown</a></li>
         <li><a href="http://pages.github.com/">GitHub Pages</a></li>
       </ul>

     </div><!-- /.site -->
  </div><!-- /.upper_footer -->

<div class="lower_footer">
  <div class="container clearfix">
    <!--[if IE]><div id="legal_ie"><![endif]-->
    <![if !IE]><div id="legal"><![endif]>
      <ul>
          <li><a href="https://github.com/site/terms">Terms of Service</a></li>
          <li><a href="https://github.com/site/privacy">Privacy</a></li>
          <li><a href="https://github.com/security">Security</a></li>
      </ul>

      <p>&copy; 2012 <span title="0.18127s from fe14.rs.github.com">GitHub</span> Inc. All rights reserved.</p>
    </div><!-- /#legal or /#legal_ie-->

      <div class="sponsor">
        <a href="http://www.rackspace.com" class="logo">
          <img alt="Dedicated Server" height="36" src="https://a248.e.akamai.net/assets.github.com/images/modules/footer/rackspaces_logo.png?1329921026" width="38" />
        </a>
        Powered by the <a href="http://www.rackspace.com ">Dedicated
        Servers</a> and<br/> <a href="http://www.rackspacecloud.com">Cloud
        Computing</a> of Rackspace Hosting<span>&reg;</span>
      </div>
  </div><!-- /.site -->
</div><!-- /.lower_footer -->

      </div><!-- /#footer -->

    

<div id="keyboard_shortcuts_pane" class="instapaper_ignore readability-extra" style="display:none">
  <h2>Keyboard Shortcuts <small><a href="#" class="js-see-all-keyboard-shortcuts">(see all)</a></small></h2>

  <div class="columns threecols">
    <div class="column first">
      <h3>Site wide shortcuts</h3>
      <dl class="keyboard-mappings">
        <dt>s</dt>
        <dd>Focus site search</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>?</dt>
        <dd>Bring up this help dialog</dd>
      </dl>
    </div><!-- /.column.first -->

    <div class="column middle" style='display:none'>
      <h3>Commit list</h3>
      <dl class="keyboard-mappings">
        <dt>j</dt>
        <dd>Move selection down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>k</dt>
        <dd>Move selection up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>c <em>or</em> o <em>or</em> enter</dt>
        <dd>Open commit</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>y</dt>
        <dd>Expand URL to its canonical form</dd>
      </dl>
    </div><!-- /.column.first -->

    <div class="column last" style='display:none'>
      <h3>Pull request list</h3>
      <dl class="keyboard-mappings">
        <dt>j</dt>
        <dd>Move selection down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>k</dt>
        <dd>Move selection up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>o <em>or</em> enter</dt>
        <dd>Open issue</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt><span class="platform-mac">⌘</span><span class="platform-other">ctrl</span> <em>+</em> enter</dt>
        <dd>Submit comment</dd>
      </dl>
    </div><!-- /.columns.last -->

  </div><!-- /.columns.equacols -->

  <div style='display:none'>
    <div class="rule"></div>

    <h3>Issues</h3>

    <div class="columns threecols">
      <div class="column first">
        <dl class="keyboard-mappings">
          <dt>j</dt>
          <dd>Move selection down</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>k</dt>
          <dd>Move selection up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>x</dt>
          <dd>Toggle selection</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>o <em>or</em> enter</dt>
          <dd>Open issue</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="platform-mac">⌘</span><span class="platform-other">ctrl</span> <em>+</em> enter</dt>
          <dd>Submit comment</dd>
        </dl>
      </div><!-- /.column.first -->
      <div class="column last">
        <dl class="keyboard-mappings">
          <dt>c</dt>
          <dd>Create issue</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>l</dt>
          <dd>Create label</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>i</dt>
          <dd>Back to inbox</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>u</dt>
          <dd>Back to issues</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>/</dt>
          <dd>Focus issues search</dd>
        </dl>
      </div>
    </div>
  </div>

  <div style='display:none'>
    <div class="rule"></div>

    <h3>Issues Dashboard</h3>

    <div class="columns threecols">
      <div class="column first">
        <dl class="keyboard-mappings">
          <dt>j</dt>
          <dd>Move selection down</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>k</dt>
          <dd>Move selection up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>o <em>or</em> enter</dt>
          <dd>Open issue</dd>
        </dl>
      </div><!-- /.column.first -->
    </div>
  </div>

  <div style='display:none'>
    <div class="rule"></div>

    <h3>Network Graph</h3>
    <div class="columns equacols">
      <div class="column first">
        <dl class="keyboard-mappings">
          <dt><span class="badmono">←</span> <em>or</em> h</dt>
          <dd>Scroll left</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="badmono">→</span> <em>or</em> l</dt>
          <dd>Scroll right</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="badmono">↑</span> <em>or</em> k</dt>
          <dd>Scroll up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="badmono">↓</span> <em>or</em> j</dt>
          <dd>Scroll down</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>t</dt>
          <dd>Toggle visibility of head labels</dd>
        </dl>
      </div><!-- /.column.first -->
      <div class="column last">
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">←</span> <em>or</em> shift h</dt>
          <dd>Scroll all the way left</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">→</span> <em>or</em> shift l</dt>
          <dd>Scroll all the way right</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">↑</span> <em>or</em> shift k</dt>
          <dd>Scroll all the way up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">↓</span> <em>or</em> shift j</dt>
          <dd>Scroll all the way down</dd>
        </dl>
      </div><!-- /.column.last -->
    </div>
  </div>

  <div >
    <div class="rule"></div>
    <div class="columns threecols">
      <div class="column first" >
        <h3>Source Code Browsing</h3>
        <dl class="keyboard-mappings">
          <dt>t</dt>
          <dd>Activates the file finder</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>l</dt>
          <dd>Jump to line</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>w</dt>
          <dd>Switch branch/tag</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>y</dt>
          <dd>Expand URL to its canonical form</dd>
        </dl>
      </div>
    </div>
  </div>

  <div style='display:none'>
    <div class="rule"></div>
    <div class="columns threecols">
      <div class="column first">
        <h3>Browsing Commits</h3>
        <dl class="keyboard-mappings">
          <dt><span class="platform-mac">⌘</span><span class="platform-other">ctrl</span> <em>+</em> enter</dt>
          <dd>Submit comment</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>escape</dt>
          <dd>Close form</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>p</dt>
          <dd>Parent commit</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>o</dt>
          <dd>Other parent commit</dd>
        </dl>
      </div>
    </div>
  </div>
</div>

    <div id="markdown-help" class="instapaper_ignore readability-extra">
  <h2>Markdown Cheat Sheet</h2>

  <div class="cheatsheet-content">

  <div class="mod">
    <div class="col">
      <h3>Format Text</h3>
      <p>Headers</p>
      <pre>
# This is an &lt;h1&gt; tag
## This is an &lt;h2&gt; tag
###### This is an &lt;h6&gt; tag</pre>
     <p>Text styles</p>
     <pre>
*This text will be italic*
_This will also be italic_
**This text will be bold**
__This will also be bold__

*You **can** combine them*
</pre>
    </div>
    <div class="col">
      <h3>Lists</h3>
      <p>Unordered</p>
      <pre>
* Item 1
* Item 2
  * Item 2a
  * Item 2b</pre>
     <p>Ordered</p>
     <pre>
1. Item 1
2. Item 2
3. Item 3
   * Item 3a
   * Item 3b</pre>
    </div>
    <div class="col">
      <h3>Miscellaneous</h3>
      <p>Images</p>
      <pre>
![GitHub Logo](/images/logo.png)
Format: ![Alt Text](url)
</pre>
     <p>Links</p>
     <pre>
http://github.com - automatic!
[GitHub](http://github.com)</pre>
<p>Blockquotes</p>
     <pre>
As Kanye West said:

> We're living the future so
> the present is our past.
</pre>
    </div>
  </div>
  <div class="rule"></div>

  <h3>Code Examples in Markdown</h3>
  <div class="col">
      <p>Syntax highlighting with <a href="http://github.github.com/github-flavored-markdown/" title="GitHub Flavored Markdown" target="_blank">GFM</a></p>
      <pre>
```javascript
function fancyAlert(arg) {
  if(arg) {
    $.facebox({div:'#foo'})
  }
}
```</pre>
    </div>
    <div class="col">
      <p>Or, indent your code 4 spaces</p>
      <pre>
Here is a Python code example
without syntax highlighting:

    def foo:
      if not bar:
        return true</pre>
    </div>
    <div class="col">
      <p>Inline code for comments</p>
      <pre>
I think you should use an
`&lt;addr&gt;` element here instead.</pre>
    </div>
  </div>

  </div>
</div>


    <div id="ajax-error-message">
      <span class="mini-icon mini-icon-exclamation"></span>
      Something went wrong with that request. Please try again.
      <a href="#" class="ajax-error-dismiss">Dismiss</a>
    </div>

    <div id="logo-popup">
      <h2>Looking for the GitHub logo?</h2>
      <ul>
        <li>
          <h4>GitHub Logo</h4>
          <a href="http://github-media-downloads.s3.amazonaws.com/GitHub_Logos.zip"><img alt="Github_logo" src="https://a248.e.akamai.net/assets.github.com/images/modules/about_page/github_logo.png?1329921026" /></a>
          <a href="http://github-media-downloads.s3.amazonaws.com/GitHub_Logos.zip" class="minibutton btn-download download"><span class="icon"></span>Download</a>
        </li>
        <li>
          <h4>The Octocat</h4>
          <a href="http://github-media-downloads.s3.amazonaws.com/Octocats.zip"><img alt="Octocat" src="https://a248.e.akamai.net/assets.github.com/images/modules/about_page/octocat.png?1329921026" /></a>
          <a href="http://github-media-downloads.s3.amazonaws.com/Octocats.zip" class="minibutton btn-download download"><span class="icon"></span>Download</a>
        </li>
      </ul>
    </div>

    
    
    
    <span id='server_response_time' data-time='0.18455' data-host='fe14'></span>
  </body>
</html>

