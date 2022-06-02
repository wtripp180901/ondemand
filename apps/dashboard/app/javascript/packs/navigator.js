import {CONTENTID, EVENTNAME as DATATABLE_EVENTNAME} from './files/data_table.js';

jQuery(function() {
  var curDir = history.state.currentDirectory;
  console.log('curDir: ' + curDir);
  jQuery('#btnNavigate').on("click", function() {
    jQuery("#divNavigator").show();
  });
});

