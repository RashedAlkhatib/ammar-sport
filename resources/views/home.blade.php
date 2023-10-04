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

                <div class="d-flex flex-wrap mb-3" style="    place-content: center;">
                    @foreach ($services as $service)

                    <div class="card m-3 p-3" >
                        <img class="card-img-top img-fluid" style="max-width: 250px;" src="{{ URL::to('/') }}/{{$service['piclocation']}}" alt="Card image cap">
                        <div class="card-body">
                            <hr>
                            <h5 class="card-title">{{$service['serviceArName']}}</h5>
                            <hr>
                            <a class="p-2 bd-highlight btn btn-warning m-2" href="{{ route('service',['id'=>$service['serviceId']]) }}">عرض</a>
                        </div>
                    </div>



                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
