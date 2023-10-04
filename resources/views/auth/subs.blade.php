@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header text-center">صفحة الاشتراك</div>
                <h3 class="text-center mt-4">:يرجى اختيار فئة الأشتراك
                </h3>
                <div class="card-body" dir="rtl">
                    <form method="POST" action="{{ route('subscribe') }}">
                        @csrf
                        <div class="row mb-3">
                            <input type="hidden" name="id" value="{{$id}}">
                            <div class="col-md-12 align-content-center text-center">
                                <div class="">
                                    <input class="form-check-input" type="radio" name="sub_type" required value="1" id="flexRadioDefault1">
                                    <label class="form-check-label" for="flexRadioDefault1">
                                        يومي (20 ريال يمني)
                                    </label>
                                </div>
                                <div class="">
                                    <input class="form-check-input" type="radio" name="sub_type" value="2" id="flexRadioDefault2" checked>
                                    <label class="form-check-label" for="flexRadioDefault2">
                                        أسبوعي (100 ريال يمني)
                                    </label>
                                </div>
                            </div>
                        </div>



                        <div class="row mb-0">
                            <div class="col-md-12 offset-md-4 text-center">
                                <button type="submit" class="btn btn-primary">
                                   الاشتراك
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
