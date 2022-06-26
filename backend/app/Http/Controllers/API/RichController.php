<?php

namespace App\Http\Controllers\API;

use Exception;
use App\Models\RichesHarta;

use App\Models\RichesUtang;
use Illuminate\Http\Request;
use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Expenditure;
use App\Models\IdealBudget;
use App\Models\Income;
use App\Models\Riches;
use Illuminate\Support\Facades\Auth;

class RichController extends Controller
{

    public function getTotal(){
        $this->total();
        $data = Riches::where('users_id', Auth::user()->id)->get();


        return  ResponseFormatter::success(  $data, 'success', 200);
    }

    public function total(){
        $total_harta = RichesHarta::where('users_id',Auth::user()->id)->sum('rupiah');
        $total_hutang = RichesUtang::where('users_id',Auth::user()->id)->sum('rupiah');
        $total_kekayaan_bersih = $total_harta - $total_hutang;
        $total_penghasilan = Income::where('users_id',Auth::user()->id)->sum('penghasilan');
        $total_pengeluaran = Expenditure::where('users_id',Auth::user()->id)->sum('pengeluaran');
        $sisa_penghasilan = $total_penghasilan - $total_pengeluaran;
        $status = ($total_harta < $total_hutang) ? 'tidak-baik' : 'baik';


        $data = [
            'users_id' => Auth::user()->id,
            'total_harta' => $total_harta,
            'total_utang' => $total_hutang,
            'total_kekayaan_bersih' => $total_kekayaan_bersih,
            'status' => $status,
            'sisa_penghasilan' => $sisa_penghasilan,
        ];

        $user = Riches::where('users_id', Auth::user()->id)->first();
        // dd($data);
        if ($user == null) {
            Riches::create($data);
        }else{
            Riches::where('users_id', Auth::user()->id)->update($data);
        }

        // return ResponseFormatter::success(['data' => $data], 'Success', 200);
    }

    public function harta(){
        $data = RichesHarta::with('user')->where('users_id', Auth::user()->id)->get();
        return ResponseFormatter::success([
            'data' => $data,
        ], 'Success', 200);
    }

    public function postHarta(Request $request){
        try {
            $request->validate([
                'harta' => 'string|required|max:225',
                'rupiah' => 'integer|required'
            ]);

            $harta = RichesHarta::create([
                'users_id' => Auth::user()->id,
                'harta' => $request->harta,
                'rupiah' => $request->rupiah
            ]);

            return ResponseFormatter::success(['harta' => $harta], 'Harta berhasil ditambahkan');
        } catch (Exception $error) {
            return ResponseFormatter::error($error->getMessage(), 'gagal menambah data');
        }
    }

    public function updateHarta(Request $request, $id){
        try {
            $request->validate([
                'harta' => 'string|required|max:225',
                'rupiah' => 'integer|required'
            ]);
            // dd($request);
            $harta = RichesHarta::find($id);
            $harta->harta = $request->harta;
            $harta->rupiah = $request->rupiah;
            $harta->save();

            return ResponseFormatter::success(['harta' => $harta], 'Harta berhasil diperbarui');
        } catch (Exception $error) {
            return ResponseFormatter::error($error->getMessage(), 'gagal mengubah data');
        }
    }

    public function deleteHarta($id){
        try {

            $harta = RichesHarta::find($id);
            $harta->delete();

            return ResponseFormatter::success(['harta' => $harta], 'Harta berhasil dihapus');
        } catch (Exception $error) {
            return ResponseFormatter::error($error->getMessage(), 'gagal menghapus data');
        }
    }

    //* hutang
    public function hutang(){
        $data = RichesUtang::where('users_id', Auth::user()->id)->get();

        return ResponseFormatter::success(['data' => $data], 'Success', 200);
    }

    public function postHutang(Request $request){
        try {
            $request->validate([
                'utang' => 'string|required|max:225',
                'rupiah' => 'integer|required'
            ]);

            $hutang = RichesUtang::create([
                'users_id' => Auth::user()->id,
                'utang' => $request->utang,
                'rupiah' => $request->rupiah
            ]);

            return ResponseFormatter::success(['hutang' => $hutang], 'Hutang berhasil ditambahkan');
        } catch (Exception $error) {
            return ResponseFormatter::error($error->getMessage(), 'gagal menambah data');
        }
    }

    public function updateHutang(Request $request){
        try {
            $request->validate([
                'utang' => 'string|required|max:225',
                'rupiah' => 'integer|required'
            ]);

            $hutang = RichesUtang::find($request->id);
            $hutang->utang = $request->utang;
            $hutang->rupiah = $request->rupiah;
            $hutang->save();

            return ResponseFormatter::success(['hutang' => $hutang], 'Hutang berhasil diperbarui');
        } catch (Exception $error) {
            return ResponseFormatter::error($error->getMessage(), 'gagal mengubah data');
        }
    }

    public function deleteHutang($id){
        try {

            $hutang = RichesUtang::find($id);
            $hutang->delete();

            return ResponseFormatter::success(['hutang' => $hutang], 'Hutang berhasil dihapus');
        } catch (Exception $error) {
            return ResponseFormatter::error($error->getMessage(), 'gagal menghapus data');
        }
    }

    //* Get Ideal Budget
    function cal_percentage($percentage, $num_total) {
        $count = ($percentage * $num_total) / 100;
        return $count;
    }

    public function idealBudget(Request $request){
        try {
            $request->validate([
                'total_penghasilan' => 'integer|required',
            ]);

            $data = [
                'users_id' => Auth::user()->id,
                'total_penghasilan' => $request->total_penghasilan,
                'agama' => $this->cal_percentage(5, $request->total_penghasilan),
                'tabungan' => $this->cal_percentage(10, $request->total_penghasilan),
                'asuransi' => $this->cal_percentage(5, $request->total_penghasilan),
                'cicilan' => $this->cal_percentage(20, $request->total_penghasilan),
                'investasi' => $this->cal_percentage(5, $request->total_penghasilan),
                'rumah_tangga' => $this->cal_percentage(40, $request->total_penghasilan),
                'anak' => $this->cal_percentage(10, $request->total_penghasilan),
                'hiburan' => $this->cal_percentage(5, $request->total_penghasilan),
            ];

            $user = IdealBudget::where('users_id', Auth::user()->id)->first();

            if ($user == null) {
                IdealBudget::create($data);
            }else{
                IdealBudget::where('users_id', Auth::user()->id)->update($data);
            }

            return ResponseFormatter::success([
                'data' => $data,
            ]);

        } catch (Exception $e) {
            return ResponseFormatter::error($e->getMessage(), 'gagal menambah data');
        }
    }

    public function getIdealBudget(){
        $data = IdealBudget::where('users_id', Auth::user()->id)->first();
        return ResponseFormatter::success(['data' => $data], 'Data berhasil diperbarui');
    }

    //* Income

    public function income(){
        $data = Income::with('users')->where('users_id', Auth::user()->id)->get();
        return ResponseFormatter::success(['data' => $data], 'Data berhasil diperbarui');
    }

    public function postIncome(Request $request){
        try {
            $request->validate([
                'penghasilan' => 'string|required|max:225',
                'rupiah' => 'integer|required'
            ]);

            $income = Income::create([
                'users_id' => Auth::user()->id,
                'penghasilan' => $request->penghasilan,
                'rupiah' => $request->rupiah
            ]);

            return ResponseFormatter::success(['income' => $income], 'Penghasilan berhasil ditambahkan');
        } catch (Exception $error) {
            return ResponseFormatter::error($error->getMessage(), 'gagal menambah data');
        }
    }

    public function updateIncome(Request $request,$id){
        try {
            $request->validate([
                'penghasilan' => 'string|required|max:225',
                'rupiah' => 'integer|required'
            ]);
            // dd($request);
            $income = Income::find($id);
            // dd($income);
            $income->penghasilan = $request->penghasilan;
            $income->rupiah = $request->rupiah;
            $income->save();

            return ResponseFormatter::success(['income' => $income], 'Penghasilan berhasil diperbarui');
        } catch (Exception $error) {
            return ResponseFormatter::error($error->getMessage(), 'gagal mengubah data');
        }
    }

    public function deleteIncome($id){
        try {

            $income = Income::find($id);
            $income->delete();

            return ResponseFormatter::success(['income' => $income], 'Penghasilan berhasil dihapus');
        } catch (Exception $error) {
            return ResponseFormatter::error($error->getMessage(), 'gagal menghapus data');
        }
    }

    // Expenditure
    public function expenditure(){
        $data = Expenditure::with('users')->where('users_id', Auth::user()->id)->get();
        return ResponseFormatter::success(['data' => $data], 'Data berhasil diperbarui');
    }

    public function postExpenditure(Request $request){
        try {
            $request->validate([
                'pengeluaran' => 'string|required|max:225',
                'rupiah' => 'integer|required'
            ]);

            $expenditure = Expenditure::create([
                'users_id' => Auth::user()->id,
                'pengeluaran' => $request->pengeluaran,
                'rupiah' => $request->rupiah
            ]);

            return ResponseFormatter::success(['expenditure' => $expenditure], 'Pengeluaran berhasil ditambahkan');
        } catch (Exception $error) {
            return ResponseFormatter::error($error->getMessage(), 'gagal menambah data');
        }
    }

    public function updateExpenditure(Request $request){
        try {
            $request->validate([
                'pengeluaran' => 'string|required|max:225',
                'rupiah' => 'integer|required'
            ]);

            $expenditure = Expenditure::find($request->id);
            $expenditure->pengeluaran = $request->pengeluaran;
            $expenditure->rupiah = $request->rupiah;
            $expenditure->save();

            return ResponseFormatter::success(['expenditure' => $expenditure], 'Pengeluaran berhasil diperbarui');
        } catch (Exception $error) {
            return ResponseFormatter::error($error->getMessage(), 'gagal mengubah data');
        }
    }

    public function deleteExpenditure($id){
        try {

            $expenditure = Expenditure::find($id);
            $expenditure->delete();

            return ResponseFormatter::success(['expenditure' => $expenditure], 'Pengeluaran berhasil dihapus');
        } catch (Exception $error) {
            return ResponseFormatter::error($error->getMessage(), 'gagal menghapus data');
        }
    }

}

?>
