@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row" style="text-align: center;">
        <div class="d-flex flex-column justify-content-center w-100 h-100">

            <div class="d-flex flex-column justify-content-center align-items-center">
                <h1 class="fw-light text-white m-0">بوابة الرياضة</h1>
                <div class="btn-group my-5 text-white" style="margin-top: 185px !important;">
                    <a href="{{route('login')}}" class="btn btn-success text-white " style="    font-size: xx-large;padding-left: 150px;padding-right: 150px; padding-top: 50px;padding-bottom: 50px;" aria-current="page"><i class="fas fa-file-download me-2"></i> ابدأ الان</a>

                </div>

            </div>
        </div>
    </div>
    </div>

    <div class="field">
        <div class="football">
        </div>

        <div>
        </div>
@endsection
