import $ from 'jquery';
window.$ = window.jQuery = $;  // expose jquery globally

// Import full jQuery UI JS and CSS from jquery-ui-dist
import 'jquery-ui-dist/jquery-ui.js';
import 'jquery-ui-dist/jquery-ui.css';

// Import FontAwesome CSS (do not import JS if only CSS icons are needed)
import '@fortawesome/fontawesome-free/css/all.min.css';

// Import other necessary libs

import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap';

import dt from 'datatables.net-bs4';
dt(window, $);
import 'datatables.net-bs4/css/dataTables.bootstrap4.min.css';

import 'apexcharts';

import 'select2/dist/css/select2.min.css';
import 'select2';

import 'tinymce';

import 'toastr/build/toastr.min.css';
import 'toastr';

// Your custom scripts here...
