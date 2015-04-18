module InvoicesHelper

  include JqgridsHelper

  def invoices_jqgrid

    options = {:on_document_ready => true, :html_tags => false}

    grid = [{
      :url => '/invoices',
      :datatype => 'json',
      :mtype => 'GET',
      :colNames => ['Inv No','Date', 'Amount','Tax','Total','Notes'],
      :colModel  => [
        { :name => 'invid',   :index => 'invid',    :width => 55},
        { :name => 'invdate', :index => 'invdate',  :width => 190 },
        { :name => 'amount',  :index => 'amount',   :width => 80,   :align => 'right', :editable => true},
        { :name => 'tax',     :index => 'tax',      :width => 80,   :align => 'right' },
        { :name => 'total',   :index => 'total',    :width => 80,   :align => 'right' },
        { :name => 'note',    :index => 'note',     :width => 150,  :sortable => false, :formatter => 'myFormatter'.to_json_var }
      ],
      :editurl => 'clientArray',
      :viewrecords=> 'true',
      :pager => '#invoices_pager',
      :rowNum => 10,
      :cellEdit => false,
      :cellsubmit => 'clientArray',
      :rowList => [10, 20, 30],
      :sortname => 'invid',
      :sortorder => 'desc',
      :viewrecords => true,
      :caption => 'My first grid',
      :onSelectRow => 'function(rowid, selected) { jQuery("#invoices_list_detail").jqGrid("setGridParam",{url: "/invoice_details/"+ rowid,datatype: "json"}); jQuery("#invoices_list_detail").trigger("reloadGrid"); }'.to_json_var
    },


    ]

    # See http://www.trirand.com/jqgridwiki/doku.php?id=wiki:navigator
    # ('navGrid','#gridpager',{parameters}, prmEdit, prmAdd, prmDel, prmSearch, prmView)
    pager = [:navGrid, "#invoices_pager", {:del => true}, {:closeAfterEdit => true, :closeOnEscape => true}, {}, {}, {}, {}]

    pager_button = [:navButtonAdd, "#invoices_pager", {:caption => 'Add', :onClickButton => 'function() { alert($("#invoices_list").getChangedCells("all"))}'.to_json_var }]

    jqgrid_api 'invoices_list', grid, pager, pager_button, options

  end


  def invoices_jqgrid_detail

    options = {:on_document_ready => true, :html_tags => false}

    grid = [{
      :url => '/invoice_details',
      :datatype => 'json',
      :mtype => 'GET',
      :colNames => ['Inv No','Date', 'Amount','Tax','Total','Notes'],
      :colModel  => [
        { :name => 'invid',   :index => 'invid',    :width => 55},
        { :name => 'invdate', :index => 'invdate',  :width => 190 },
        { :name => 'amount',  :index => 'amount',   :width => 80,   :align => 'right', :editable => true},
        { :name => 'tax',     :index => 'tax',      :width => 80,   :align => 'right' },
        { :name => 'total',   :index => 'total',    :width => 80,   :align => 'right' },
        { :name => 'note',    :index => 'note',     :width => 150,  :sortable => false, :formatter => 'myFormatter'.to_json_var }
      ],
      :editurl => 'clientArray',
      :pager => '#invoices_pager_detail',
      :rowNum => 10,
      :cellEdit => true,
      :cellsubmit => 'clientArray',
      :rowList => [10, 20, 30],
      :sortname => 'invid',
      :sortorder => 'desc',
      :viewrecords => true,
      :caption => 'My first grid'
    },
    

    ]

    # See http://www.trirand.com/jqgridwiki/doku.php?id=wiki:navigator
    # ('navGrid','#gridpager',{parameters}, prmEdit, prmAdd, prmDel, prmSearch, prmView)
    pager = [:navGrid, "#invoices_pager_detail", {:del => true}, {:closeAfterEdit => true, :closeOnEscape => true}, {}, {}, {}, {}]

    pager_button = [:navButtonAdd, "#invoices_pager_detail", {:caption => 'Add', :onClickButton => 'function() { alert($("#invoices_list").getChangedCells("all"))}'.to_json_var }]

    jqgrid_api 'invoices_list_detail', grid, pager, pager_button, options

  end

end
