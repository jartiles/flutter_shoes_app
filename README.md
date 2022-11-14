# Flutter - Shoes app

A flutter project to display shoes by brand or category. Manages a static list for brands and a request to <a href="https://rapidapi.com/kaushiksheel9/api/shoes-collections" target="_blank">SHOES COLLECTION API</a> for the New Arrivals section.

Design inspired by <a href="https://www.behance.net/gallery/153198417/Shose-App-UI-Design" target="_blank">phatnguyen69</a> 

<div>
    <img src="https://img.shields.io/badge/Made%20with-flutter-blue">
    <img src="https://img.shields.io/badge/SDK%20version-%3E%3D2.18.1-orange">
</div>

## Packages

<ul>
    <li>
        <a href="https://pub.dev/packages/animate_do" target="_blank">Animate Do</a>
    </li>
    <li>
        <a href="https://pub.dev/packages/http" target="_blank">Http</a>
    </li>
    <li>
        <a href="https://pub.dev/packages/provider" target="_blank">Provider</a>
    </li>
    <li>
        <a href="https://pub.dev/packages/skeletons" target="_blank">Skeletons</a>
    </li>
</ul>

## Requirements

To obtain the images it`s necessary to include the SHOES API token. <a href="https://rapidapi.com/kaushiksheel9/api/shoes-collections" target="_blank">Get it here.</a> 

Then you must write your token in the line 'YOUR-TOKEN'. Located in the lib/providers/shoes_provider.dart file.

## Screenshots
<div style="display:grid; grid-template-columns: 1fr 1fr 1fr;">
    <div style="margin: 0 10px">
        <p style="font-size: 16px; font-weight: bold;">Select Gender</p>
        <img  width="300" height="650" src="https://res.cloudinary.com/dinz56p67/image/upload/v1668466457/flutter%20shoes%20app/1-category_select_p2t3xv.gif">
    </div>
    <div style="margin: 0 10px">
        <p style="font-size: 16px; font-weight: bold;">Select Brand</p>
        <img  width="300" height="650" src="https://res.cloudinary.com/dinz56p67/image/upload/v1668466725/flutter%20shoes%20app/2-brand_select_dbhxpr.gif">
    </div>
    <div style="margin: 0 10px">
        <p style="font-size: 16px; font-weight: bold;">Detail Screen</p>
        <img  width="300" height="650" src="https://res.cloudinary.com/dinz56p67/image/upload/v1668466450/flutter%20shoes%20app/3-detail_xfqc99.gif">
    </div>
    <div style="margin: 0 10px">
        <p style="font-size: 16px; font-weight: bold;">Detail Hero Animation</p>
        <img  width="300" height="650" src="https://res.cloudinary.com/dinz56p67/image/upload/v1668466466/flutter%20shoes%20app/4-detail_back_i8kwts.gif">
    </div>
</div>
