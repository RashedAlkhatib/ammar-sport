@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="d-flex flex-wrap mb-3" style="    place-content: center;">

            @foreach ($services as $service)
            <a class="p-2 bd-highlight btn btn-warning m-2" href="{{ route('service',['id'=>$service['serviceId']]) }}">{{$service['serviceArName']}}</a>
            @endforeach
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="d-flex flex-wrap mb-3 align-items-center" style="    place-content: center;">
                    @foreach ($content as $content)
                    <?php
                    $a = $content['ar_cntnt'];
                    $targets = array('mp4', 'mov', 'avi');
                    $_isVideo = false;
                    foreach ($targets as $t) {
                        if (strpos($a, $t) !== false) {
                            $_isVideo = true;
                            break;
                        }
                    }

                    if (!$_isVideo) {
                        ?>
                        <div class="card m-3 p-3">
                            <img class="card-img-top img-fluid" style="max-width: 250px;"
                                 src="{{$content['ar_cntnt']}}" alt="Card image cap">
                            <div class="card-body">
                                <hr>
                            </div>
                        </div>
                        <?php
                    } else {
                        ?>

                        <div class="card m-3 p-3 ">

                            <video class="card-img-top img-fluid" style="max-width: 400px;" width="300" height="300"
                                   controls>
                                <source src="{{$content['ar_cntnt']}}" type="video/mp4">
                            </video>


                            <div class="card-body">
                                <hr>
                            </div>
                        </div>


                        <?php

                    }
                    ?>


                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
