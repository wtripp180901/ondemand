import {CONTENTID, EVENTNAME as DATATABLE_EVENTNAME} from './files/data_table.js';

jQuery(function() {
  jQuery('#btnNavigate').on("click", function() {
    console.log('NAVIGATOR.JS navigator: ' + navigator);
    jQuery("#divNavigator").show();

    // const eventDataDT = {
    //   'url': '/pun/dev/dashboard/files/fs//users/PZS0714/gbyrket',
    // };

    // jQuery(CONTENTID).trigger(DATATABLE_EVENTNAME.reloadTable, eventDataDT);

  });
});

